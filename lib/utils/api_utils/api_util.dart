abstract class ApiUtil {

Map<String, String> loginRequestBody(String email, String password);

Map<String, String> registerRequestBody(
    String name,
    String phone,
    String email,
    String password,
    );

}