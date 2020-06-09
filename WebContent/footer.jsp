<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8" name="google-signin-client_id"
	content="535880499912-miafr5t9hp5h7tu4630rspss8q0huacc.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">

<footer class="site-footer" id="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="mb-5">
					<h3 class="footer-heading mb-4">關於隨心居</h3>
					<p></p>
				</div>
			</div>
			<div class="col-lg-4 mb-5 mb-lg-0">
				<div class="row mb-5">
					<div class="col-md-12">
						<h3 class="footer-heading mb-4">Navigations</h3>
					</div>
					<!-- <div class="col-md-6 col-lg-6">
              <ul class="list-unstyled">
                <li><a href="#">Home</a></li>
                <li><a href="#">Buy</a></li> -->
					<!-- <li><a href="#">Rent</a></li> -->
					<!-- <li><a href="#">Properties</a></li>
              </ul>
            </div> -->
					<div class="col-md-6 col-lg-6">
						<ul class="list-unstyled">
							<li><a href="#">關於我們</a></li>
							<li><a href="#">隱私條款</a></li>
							<li><a href="#">聯絡我們</a></li>
							<!-- <li><a href="#">Terms</a></li> -->
						</ul>
					</div>
				</div>


			</div>

			<div class="col-lg-4 mb-5 mb-lg-0">
				<h3 class="footer-heading mb-4">關注我們</h3>

				<div>
					<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
					<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
				</div>



			</div>

		</div>
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script data-cfasync="false"
						src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart text-danger" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">好家在</a>
					<script src="https://apis.google.com/js/platform.js"></script>
					<script>
						let logout = document.getElementById("logout");
						console.log(logout);
						if (logout) {
							console.log("123")
							window.onload = function() {
								gapi.load('auth2', function() {
									gapi.auth2.init();
									console.log("auth2 load");
								});

								console.log(logout)
								logout.onclick = googleLogout;
								logout.ontouchstart = googleLogout;

								function googleLogout() {
									console.log("456")
									let auth2 = gapi.auth2.getAuthInstance();
									auth2.signOut().then(function() {
										window.location.href = "<c:url value='logout'/>"
										console.log('User signed out.');
									});
								}
							}
						}
					</script>

					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>

		</div>
	</div>
</footer>