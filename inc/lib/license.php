<?php
/* 
실 오픈시 발급 
도메인 + 사이트유니크키
*/


class Lisence {
	static $keys = []; 

	static function add($newLisence = ''){
		if(isset($newLisence) && !empty($newLisence)) {
			self::$keys[] = $newLisence;
		}
	}
	
	static function getAll(){
		return self::$keys; 
	}
}

// 실서버는 아래 주석 해제
// Lisence::add('a86edd6c3050e3d779c750ba41f6f3bfb73aee17fc8eba65f5ffddf9711d6881');
// Lisence::add('937e8d5fbb48bd4949536cd65b8d35c426b80d2f830c5c308e2cdec422ae2244');


// Lisence::add('a33855a0c31b667eaeafb3d3468314d55c53653594b1bf4fc826ecfacc0d19c4');
// Lisence::add('528a04b7a2627d16037c0ce788dcca206ed5b49e61ae5760635ca99bb8ecdb17');



// 개발서버는 아래 주석 해제
Lisence::add('a2112c254dc2957a810942fd2dcf0c5fc98672af5787ad958c6f4e6b4090af62');
Lisence::add('4856f7291d9da9dc20845bfd28cc628e1f4960b2ffd926326601a78ae0b9e8b9');