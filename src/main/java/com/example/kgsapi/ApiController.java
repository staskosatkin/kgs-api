package com.example.kgsapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
	@PostMapping("/fetch")
	public String fetch() {
		return redisTemplate.opsForList().leftPop("hash-queue");
	}
	
}
