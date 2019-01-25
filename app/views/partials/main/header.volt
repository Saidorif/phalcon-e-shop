  <!-- Header -->
  <!-- HEADER -->
	{% set url = helper.currentUrl(constant('LANG')) %}
	{% set user = helper.isUserSession() %}
	{% set isAuth = helper.isAdminSession() %}
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>{{helper.translate('SITE NAME')}}</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="#">Store</a></li>
						<li><a href="#">Newsletter</a></li>
						<li><a href="#">FAQ</a></li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">ENG <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
							    <a href="{{ url }}"><img src="/{{ helper.logo() }}" alt=""></a>

								{% set languages = helper.languages() %}
								{% if languages|length > 1 %}
							        {% for language in languages %}
							          <li>
							            {{ helper.langSwitcher(language['iso'], language['name']) }}
							          </li>
							        {% endfor %}
								{% endif %}								
							</ul>
						</li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">USD <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">USD ($)</a></li>
								<li><a href="#">EUR (€)</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->
{% set url = helper.currentUrl(constant('LANG')) %}
		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="{{url}}">
							<img src="/{{helper.logo()}}" alt="{{helper.translate('SITE NAME')}}">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					<div class="header-search">
						<form>
							<input class="input search-input" type="text" placeholder="Enter your keyword">
							{{helper.widget('Products').categoryDropdownList()}}
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								{% if isAuth %}
								<strong class="text-uppercase">{{helper.translate('My Account')}} <i class="fa fa-caret-down"></i></strong>
								{% endif %}
							</div>
							{% if user %}
							<h5>{{user.name}} </h5>
							{% else %}
							<a href="{{url}}admin" class="text-uppercase">{{helper.translate('Login')}}</a> / <a href="{{url}}user/register" class="text-uppercase">{{helper.translate('Join')}}</a>
							{% endif %}
							{% if isAuth %}
							<ul class="custom-menu">
								<li><a href="{{url}}user/index"><i class="fa fa-user-o"></i> {{helper.translate('Profile')}}</a></li>
								<li><a href="#"><i class="fa fa-heart-o"></i> {{helper.translate('My Wishlist')}}</a></li>
								<li><a href="#"><i class="fa fa-exchange"></i> {{helper.translate('Compare')}}</a></li>
								<li><a href="{{url}}user/checkout"><i class="fa fa-check"></i> {{helper.translate('Checkout')}}</a></li>
								<li>
									<a>
										<form action="{{ url.get() }}admin/index/logout" method="post">
		                  <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
		                  <button class="btn btn-sm btn-danger" type="submit">
		                    <i class="fa fa-sign-out"></i>
		                    Logout
		                  </button>
		                </form>
									</a>
								</li>
							</ul>
							{% endif %}
						</li>
						<!-- /Account -->

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty productQty">0</span>
								</div>
								<strong class="text-uppercase">{{helper.translate('My Cart')}}:</strong>
								<br>
								<span id="productTotal"></span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list" id="shopping-cart-list">
									</div>
									<div class="shopping-cart-btns">
										<a href="/viewcart" class="main-btn">{{helper.translate('View Cart')}}</a>
										<a href="#" class="primary-btn">{{helper.translate('Checkout')}} <i class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->
