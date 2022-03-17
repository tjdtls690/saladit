package project.spring.web.find_info;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;
import project.spring.web.naver_sms_api.NaverSensSMS;

@Controller
public class FindInfoController {
	
	private static Logger logger = LoggerFactory.getLogger(NaverSensSMS.class); 
    
    private static final String FROM="01057113386";    
    private static final String accessKey = "cUMNPR7GznTx4kGxTehF";                                     // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
    private static final  String secretKey = "0ubfo6DS9trNsS6TanLjdDFdKZoNYUBBYCO9V7fk";                // 2차 인증을 위해 서비스마다 할당되는 service secret
    private static final  String serviceId = "ncp:sms:kr:281225030758:saladit_sms";
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/findId.do")
	public ModelAndView findIdDo(ModelAndView mav) {
		mav.setViewName("find_id");
		return mav;
	}
	
	@RequestMapping("/findPassword.do")
	public ModelAndView findPasswordDo(ModelAndView mav) {
		mav.setViewName("findPassword");
		return mav;
	}
	
	@RequestMapping(value = "/requestInfoBefore.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestInfoBeforeDo(MemberVO vo) {
		int check = memberService.findEmail(vo);
		if(check == 1) {
			MemberVO vo1 = memberService.phoneNameGetMember(vo);
			if(vo1.getMemberType().equals("k")) {
				return "1";
			}else if(vo1.getMemberType().equals("g")) {
				return "2";
			}else {
				return "3";
			}
		}else {
			return "0";
		}
	}
	
	@RequestMapping(value = "/requestPasswordInfoBefore.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestPasswordInfoBeforeDo(MemberVO vo) {
		int check = memberService.findPassword(vo);
		if(check == 1) {
			MemberVO vo1 = memberService.EmailPhoneGetMember(vo);
			if(vo1.getMemberType().equals("k")) {
				return "1";
			}else if(vo1.getMemberType().equals("g")) {
				return "2";
			}else {
				return "3";
			}
		}else {
			return "0";
		}
	}
	
	@RequestMapping("/requestInfo.do")
	public ModelAndView requestInfoDo(ModelAndView mav) {
		mav.setViewName("findError");
		return mav;
	}
	
	@RequestMapping("/findEmailSuccess.do")
	public ModelAndView findEmailSuccessDo(ModelAndView mav) {
		mav.setViewName("findEmailSuccess");
		return mav;
	}
	
	@RequestMapping("/findInfoFinal.do")
	public ModelAndView findInfoFinalDo(ModelAndView mav) {
		mav.setViewName("findInfoFinal");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findIdMessage.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String findIdMessageDo(MemberVO vo1) {
		
    	MemberVO vo2 = memberService.phoneNameGetMember(vo1);
    	String contentMessge = "[샐러딧] 요청하신 아이디는 " + vo2.getEmail() + " 입니다.";
    	
        logger.debug("SMS 전송 시작");
        logger.debug("contentMessge :" +contentMessge);
        logger.debug("phoneList :" +vo1.getPhone()); 
         
         
         
        String hostNameUrl = "https://sens.apigw.ntruss.com";           // 호스트 URL
        String requestUrl= "/sms/v2/services/";                         // 요청 URL
        String requestUrlType = "/messages";                            // 요청 URL
                                             
        String method = "POST";                                         // 요청 method
        String timestamp = Long.toString(System.currentTimeMillis());   // current timestamp (epoch)
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;
         
         
        // JSON 을 활용한 body data 생성      
        JSONObject bodyJson = new JSONObject();     
        JSONArray  toArr = new JSONArray();
    
        bodyJson.put("type", "SMS");                // 메시지 Type (sms | lms)
        bodyJson.put("contentType","COMM");         // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
        bodyJson.put("countryCode","82");       // 국가 전화번호
        bodyJson.put("from",FROM);              // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.        
        bodyJson.put("subject","");             // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
        bodyJson.put("content",contentMessge);              // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
        bodyJson.put("messages", toArr);        
                
         
//        if(phone==null) {
//            for(int i=0; i<phoneList.size(); i++) {    
//                JSONObject toJson = new JSONObject();
//                toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
//                toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
//                toJson.put("to",phoneList.get(i).toString());       // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
//                toArr.add(toJson);              
//                //System.out.print(phoneList.get(i).toString() + " , ");
//            }
//             
//        }else{
            //개별 전송
            JSONObject toJson = new JSONObject();
            toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
            toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
            toJson.put("to", vo1.getPhone());        // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
            toArr.add(toJson);
//        }
         
        String body = bodyJson.toJSONString();
        logger.debug(body);
         
        try {
 
            URL url = new URL(apiUrl);
 
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
             
            wr.write(body.getBytes());
            wr.flush();
            wr.close();
 
            int responseCode = con.getResponseCode();
            BufferedReader br;
            logger.debug("responseCode" +" " + responseCode);
             
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
 
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
             
            logger.debug("전송 성공");
            logger.debug(response.toString());
 
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findPasswordMessage.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String findPasswordMessageDo(MemberVO vo1) {
		String randomPW = randomPassword();
		vo1.setPassword(randomPW);
		memberService.updatePassword(vo1);
    	String contentMessge = "[샐러딧] 요청하신 임시 비밀번호는 " + randomPW + " 입니다.";
    	
        logger.debug("SMS 전송 시작");
        logger.debug("contentMessge :" +contentMessge);
        logger.debug("phoneList :" +vo1.getPhone()); 
         
         
         
        String hostNameUrl = "https://sens.apigw.ntruss.com";           // 호스트 URL
        String requestUrl= "/sms/v2/services/";                         // 요청 URL
        String requestUrlType = "/messages";                            // 요청 URL
                                             
        String method = "POST";                                         // 요청 method
        String timestamp = Long.toString(System.currentTimeMillis());   // current timestamp (epoch)
        requestUrl += serviceId + requestUrlType;
        String apiUrl = hostNameUrl + requestUrl;
         
         
        // JSON 을 활용한 body data 생성      
        JSONObject bodyJson = new JSONObject();     
        JSONArray  toArr = new JSONArray();
    
        bodyJson.put("type", "SMS");                // 메시지 Type (sms | lms)
        bodyJson.put("contentType","COMM");         // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
        bodyJson.put("countryCode","82");       // 국가 전화번호
        bodyJson.put("from",FROM);              // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.        
        bodyJson.put("subject","");             // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
        bodyJson.put("content",contentMessge);              // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
        bodyJson.put("messages", toArr);        
                
         
//        if(phone==null) {
//            for(int i=0; i<phoneList.size(); i++) {    
//                JSONObject toJson = new JSONObject();
//                toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
//                toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
//                toJson.put("to",phoneList.get(i).toString());       // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
//                toArr.add(toJson);              
//                //System.out.print(phoneList.get(i).toString() + " , ");
//            }
//             
//        }else{
            //개별 전송
            JSONObject toJson = new JSONObject();
            toJson.put("subject","");                           // 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
            toJson.put("content",contentMessge);                // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
            toJson.put("to", vo1.getPhone());        // 수신번호 목록  * 최대 1000개까지 한번에 전송할 수 있습니다.
            toArr.add(toJson);
//        }
         
        String body = bodyJson.toJSONString();
        logger.debug(body);
         
        try {
 
            URL url = new URL(apiUrl);
 
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
             
            wr.write(body.getBytes());
            wr.flush();
            wr.close();
 
            int responseCode = con.getResponseCode();
            BufferedReader br;
            logger.debug("responseCode" +" " + responseCode);
             
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
 
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
             
            logger.debug("전송 성공");
            logger.debug(response.toString());
 
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
	}
	
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
        String space = " ";                    // one space
        String newLine = "\n";                 // new line
        String message = new StringBuilder()
            .append(method)
            .append(space)
            .append(url)
            .append(newLine)
            .append(timestamp)
            .append(newLine)
            .append(accessKey)
            .toString();
 
        SecretKeySpec signingKey;
        String encodeBase64String;
        try {
             
            signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
        } catch (UnsupportedEncodingException e) {
            encodeBase64String = e.toString();
        }
         
      return encodeBase64String;
    }
	
	
	public String randomPassword() {
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 8;
		Random random = new Random();

		String generatedString = random.ints(leftLimit,rightLimit + 1)
		  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		  .limit(targetStringLength)
		  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		  .toString();

		return generatedString;
	}
}
