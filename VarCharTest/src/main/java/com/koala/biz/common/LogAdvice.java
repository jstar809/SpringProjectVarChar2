package com.koala.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service 
@Aspect //aspect 처리된 횡단관심사야 
public class LogAdvice {

	  //내가 이용할 횡단관심 위에 사용
	  @Pointcut("execution(* com.koala.biz..*Impl.*(..))") 
	  public void aPointcut() {}

	
	@Before("aPointcut()") 
	public void printLog(JoinPoint jp) {
		String methodName=jp.getSignature().getName();
		//현재 수행중인 포인트컷(핵심로직,CRUD)의 메서드명 
		Object[] args=jp.getArgs();
		//현재 수행중인 포인트컷(핵심로직,CRUD)이 사용하는 인자들의 정보 

		System.out.println("수행중인 핵심메서드명: " + methodName);
		System.out.println("사용하는 인자 ");
		System.out.println("==========");
		for(Object v:args) {
			System.out.println(v);
		}
	}
}