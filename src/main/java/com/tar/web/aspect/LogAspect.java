package com.tar.web.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@Aspect
@Slf4j
@Component
public class LogAspect {

    @Around("execution(* com.tar.web.board.controller..*(..))")
    public Object aroundLog(ProceedingJoinPoint jp) throws Throwable {
        log.debug(".......................................................................");
        log.debug("-----------------------------------------------------------------------");
        log.debug("------ ** METHOD : {}", jp.getSignature().getName());
        log.debug("------ ** LOCATION : {}", jp.getSignature().toShortString());
        log.debug("------ ** PARAMETER : {}", jp.getArgs());
        log.debug("------ ** TARGET : {}", jp.getTarget());
        log.debug("-----------------------------------------------------------------------");
        Object returnObj = jp.proceed();
        return returnObj;
    }
}
