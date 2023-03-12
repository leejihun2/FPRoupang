onload = function() {
	var acc = document.getElementsByClassName("accordion");
	var i;
	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			/* 현재 버튼의 클래스가 active이면 제거하고 패널 숨기기 */
			if (this.classList.contains("active")) {
				this.classList.remove("active");
				this.nextElementSibling.style.display = "none";
			} else {
				/* 현재 버튼의 클래스가 active가 아니면 추가하고 패널 보이기 */
				this.classList.add("active");
				this.nextElementSibling.style.display = "block";
			}
		});
	}
}