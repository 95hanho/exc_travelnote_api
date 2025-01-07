package me._hanho.travelnote.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me._hanho.travelnote.service.TokenService;

@Component
public class JwtInterceptor implements HandlerInterceptor {
	
	@Autowired
	private TokenService tokenService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String access_token = request.getHeader("Expert-Access");
		
		if (access_token != null && !access_token.isEmpty()) {
            try {
                // JWT 파싱 및 복호화
                Claims claims = tokenService.parseJwtToken(access_token);

                // login_id 추출
                String loginId = claims.get("member_id", String.class);

                // HttpServletRequest에 login_id 추가
                request.setAttribute("member_id", loginId);
            } catch (Exception e) {
                // 토큰이 유효하지 않으면 요청을 거부
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return false;
            }
        }

        return true;
	}
}
