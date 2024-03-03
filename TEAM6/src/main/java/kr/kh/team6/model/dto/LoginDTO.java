package kr.kh.team6.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginDTO {

	private String id;
	private String pw;
}
