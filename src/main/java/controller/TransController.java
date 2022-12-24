package controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.TransService;

@Controller
public class TransController {
private TransService transService;
	
	public TransController(TransService transService) {
		this.transService = transService;
	}
	
	@RequestMapping("/trans/translate")
	@ResponseBody
	public Map<String, String> translate(HttpServletRequest request) {
		
		String source = request.getParameter("source");
		String target = request.getParameter("target");
		String paramtext = request.getParameter("text");
		
		
		String clientId = "qbfC9arjrNyqLiLs180z"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "xSr0f7uvHu"; //애플리케이션 클라이언트 시크릿값";
        
        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
        String text;
        try {
            text = URLEncoder.encode(paramtext, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = post(apiURL, requestHeaders, text, source,target);

        System.out.println(responseBody);
        
        String transText = "";
        String transLang = "";
        Map<String, String> map = new HashMap<String, String>();
        JSONObject hi = null;
        
        try {
        	JSONParser parser = new JSONParser();
        	JSONObject json = (JSONObject)parser.parse(responseBody);
        	
        	JSONObject result = (JSONObject)((JSONObject)json.get("message")).get("result");
        	
        	
        	transText = (String)result.get("translatedText");
        	transLang = (String)result.get("tarLangType");
        	
        	
        	map.put("transText", transText);
        	map.put("transLang", transLang);
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
//        System.out.println(map.toString());
        return map;
//        return hi;
//        String result = map.toString();
//        System.out.println(result);
//        return result;
        
        
	}
	
	private String post(String apiUrl, Map<String, String> requestHeaders, String text, String source,String target){
        HttpURLConnection con = connect(apiUrl);
        String postParams = "source="+source+"&target="+target+"&text="+text; //원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
