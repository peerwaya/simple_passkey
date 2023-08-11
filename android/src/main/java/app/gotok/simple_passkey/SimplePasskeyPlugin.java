package app.gotok.simple_passkey;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CreatePublicKeyCredentialRequest;
import androidx.credentials.CreatePublicKeyCredentialResponse;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetPublicKeyCredentialOption;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialInterruptedException;
import androidx.credentials.exceptions.CreateCredentialProviderConfigurationException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * SimplePasskeyPlugin
 */
public class SimplePasskeyPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context context;

    private Activity activity;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "simple_passkey");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("createPassKey")) {
            String json = (String) call.argument("json");
            Boolean preferImmediatelyAvailableCredentials = (Boolean) call.argument("preferImmediatelyAvailableCredentials");
            byte[] clientDataHash = (byte[]) call.argument("clientDataHash");
            this.createPasskey(json, clientDataHash, preferImmediatelyAvailableCredentials != null ? preferImmediatelyAvailableCredentials : true, result);
        } else if (call.method.equals("getPassKey")) {
            String json = (String) call.argument("json");
            Boolean preferImmediatelyAvailableCredentials = (Boolean) call.argument("preferImmediatelyAvailableCredentials");
            byte[] clientDataHash = (byte[]) call.argument("clientDataHash");
            this.getPasskey(json, clientDataHash, preferImmediatelyAvailableCredentials, result);
        } else if (call.method.equals("isSupported")) {
            result.success(Build.VERSION.SDK_INT >= Build.VERSION_CODES.P);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    public void createPasskey(String requestJson, @Nullable byte[] clientDataHash, boolean preferImmediatelyAvailableCredentials, @NonNull Result result) {
        CredentialManager credentialManager = CredentialManager.create(activity);
        CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest =
                new CreatePublicKeyCredentialRequest(
                        requestJson, clientDataHash, preferImmediatelyAvailableCredentials);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            credentialManager.createCredentialAsync(
                    activity,
                    createPublicKeyCredentialRequest,
                    null,
                    activity.getMainExecutor(),
                    new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {
                        @Override
                        public void onResult(CreateCredentialResponse createCredentialResponse) {
                            if (createCredentialResponse instanceof CreatePublicKeyCredentialResponse) {
                                CreatePublicKeyCredentialResponse publicKeyCredentialResponse = (CreatePublicKeyCredentialResponse) createCredentialResponse;
                                result.success(publicKeyCredentialResponse.getRegistrationResponseJson());
                            } else {
                                result.error("invalid_credential_type", createCredentialResponse.getType(), null);
                            }
                        }

                        @Override
                        public void onError(@NonNull CreateCredentialException e) {
                            if (e instanceof CreatePublicKeyCredentialDomException) {
                                // Handle the passkey DOM errors thrown according to the
                                // WebAuthn spec.
                                result.error("credential_dom_exception", ((CreatePublicKeyCredentialDomException) e).getMessage(), null);
                            } else if (e instanceof CreateCredentialCancellationException) {
                                // The user intentionally canceled the operation and chose not
                                // to register the credential.
                                result.error("user_canceled", e.getMessage(), null);
                            } else if (e instanceof CreateCredentialInterruptedException) {
                                // Retry-able error. Consider retrying the call.
                                result.error("retry", e.getMessage(), null);
                            } else if (e instanceof CreateCredentialProviderConfigurationException) {
                                // Your app is missing the provider configuration dependency.
                                // Most likely, you're missing the
                                // "credentials-play-services-auth" module.
                                result.error("missing_configuration", e.getMessage(), null);
                            } else {
                                result.error("unknown", e.getMessage(), null);
                            }
                        }
                    });
        }
    }

    public void getPasskey(String requestJson, @Nullable byte[] clientDataHash, boolean preferImmediatelyAvailableCredentials,  @NonNull Result result) {
        CredentialManager credentialManager = CredentialManager.create(activity);
        GetPublicKeyCredentialOption getPublicKeyCredentialOption =
                new GetPublicKeyCredentialOption(requestJson, clientDataHash);
        GetCredentialRequest getCredRequest = new GetCredentialRequest.Builder()
                .addCredentialOption(getPublicKeyCredentialOption)
                .setPreferImmediatelyAvailableCredentials(preferImmediatelyAvailableCredentials)
                .build();

        Log.d("preferImmediatelyAvailableCredentials", ""+preferImmediatelyAvailableCredentials);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            credentialManager.getCredentialAsync(
                    activity,
                    getCredRequest,
                    null,
                    activity.getMainExecutor(),
                    new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                        @Override
                        public void onResult(GetCredentialResponse getCredentialResponse) {
                            Credential credential = getCredentialResponse.getCredential();
                            if (credential instanceof PublicKeyCredential) {
                                String responseJson = ((PublicKeyCredential) credential)
                                        .getAuthenticationResponseJson();
                                result.success(responseJson);
                            } else {
                                result.error("invalid_credential_type", credential.getClass().getName(), null);
                            }
                        }

                        @Override
                        public void onError(@NonNull GetCredentialException e) {
                            if (e instanceof GetPublicKeyCredentialDomException) {
                                // Handle the passkey DOM errors thrown according to the
                                // WebAuthn spec.
                                result.error("credential_dom_exception", ((GetPublicKeyCredentialDomException) e).getMessage(), null);
                            } else if (e instanceof GetCredentialCancellationException) {
                                // The user intentionally canceled the operation and chose not
                                // to register the credential.
                                result.error("user_canceled", e.getMessage(), null);
                            } else if (e instanceof GetCredentialInterruptedException) {
                                // Retry-able error. Consider retrying the call.
                                result.error("retry", e.getMessage(), null);
                            } else if (e instanceof GetCredentialProviderConfigurationException) {
                                // Your app is missing the provider configuration dependency.
                                // Most likely, you're missing the
                                // "credentials-play-services-auth" module.
                                result.error("missing_configuration", e.getMessage(), null);
                            } else {
                                result.error("unknown", e.getMessage(), null);
                            }
                        }
                    });
        }
    }
}
