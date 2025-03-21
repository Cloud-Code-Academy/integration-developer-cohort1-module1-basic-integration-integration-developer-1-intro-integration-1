public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        String response;
        Http http = new Http();                                         // 1. Create a new HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);               // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        req.setMethod('GET');                                        // 3. Set the HTTP method to 'GET'
        try {                                                       // 4. Send the request and get the response
            HttpResponse res = http.send(req);                     // 5. Return the response body as string
            if(res.getStatusCode() >= 200 && res.getStatusCode() <300) {
                response = res.getBody();
            }
            else {
                response = 'Status code: ' + res.getStatusCode() + 'Status: ' + res.getStatus();
            }
        } 
        catch (Exception ex) {
            response = 'There was an error: ' + ex.getMessage();
        }
        return response;
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {        
        HttpRequest req = new HttpRequest();                                // 1. Create a new HTTP request        
        req.setEndpoint(BASE_URL + '/posts');                              // 2. Set the endpoint URL using BASE_URL + '/posts'
        req.setMethod('POST');                                             // 3. Set the HTTP method to 'POST'
        Map<String, Object> jsonMap = new Map<String, Object>{
            'userId' => userId,
            'title' => title,
            'body' => body
            };
        String jsonMapString = JSON.serialize(jsonMap);
        req.setBody(jsonMapString);      
        Http http = new Http();
        HttpResponse res = Http.send(req);                           // 6. Send the request and get the response        
        return res.getBody();                                       // 7. Return the response body as string
    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        String response;          
        Http http = new Http(); // 1. Create a new HTTP request
        HttpRequest req = new HttpRequest();           
        req.setEndpoint(BASE_URL + '/posts/' + postId);// 2. Set the endpoint URL using BASE_URL + '/posts/' + postId           
        req.setMethod('PUT'); // 3. Set the HTTP method to 'PUT'
        req.setHeader('Content-Type', 'application/json'); 
        Map<String, Object> jsonMap = new Map<String, Object>{
            'id' => postId,
            'title' => title,
            'body' => body,
            'userId' => userId
            };
        String jsonMapString = JSON.serialize(jsonMap);
        //String jsonString = '{"id" : 1,"title" : " ' + title + ' ", "body" : "' + body + '","userId" : ' + userId + '}';// 4. Create a JSON string with the updated post data
        req.setBody(jsonMapString);            // 5. Set the request body
        try {            // 6. Send the request and get the response
            HttpResponse res = Http.send(req);
            if(res.getStatusCode() >= 200 && res.getStatusCode() <300) {
                response = res.getBody();
            }
            else {
                response = 'Status code: ' + res.getStatusCode() + 'Status: ' + res.getStatus();
            }
        } 
        catch (Exception ex) {
            response = 'There was an error: ' + ex.getMessage();
        } 
        return response;// 7. Return the response body as string
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        String response;            
        Http http = new Http();     // 1. Create a new HTTP request
        HttpRequest req = new HttpRequest();            
        req.setEndpoint(BASE_URL + '/posts/' + postId);     // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId            
        req.setMethod('PATCH');     // 3. Set the HTTP method to 'PATCH'            
        String body = '{"title" : "' + title + '"}';        // 4. Create a JSON string with only the title            
        req.setBody(body);      // 5. Set the request body            
        try {                   // 6. Send the request and get the response
            HttpResponse res = Http.send(req);
            if(res.getStatusCode() >= 200 && res.getStatusCode() < 300 ) {
                response = res.getBody();
            }
            else {
                response = 'Status code: ' + res.getStatusCode() + 'Status: ' + res.getStatus();
            }
        } 
        catch (Exception ex) {
            response = 'There was an error: ' + ex.getMessage();
        }
            
        return response;// 7. Return the response body as string
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        Integer response;            
        Http http = new Http(); // 1. Create a new HTTP request
        HttpRequest req = new HttpRequest();            
        req.setEndpoint(BASE_URL + '/posts/' + postId); // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId            
        req.setMethod('DELETE'); // 3. Set the HTTP method to 'DELETE'            
        HttpResponse res = http.send(req); // 4. Send the request and get the response            
        response = res.getStatusCode(); // 5. Return the response status code
        return response;
    }
} 