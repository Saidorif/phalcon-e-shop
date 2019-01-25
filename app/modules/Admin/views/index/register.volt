<div class="container">
  <form class="form-register" method="post">
    {% if register %}
    <div class="alert alert-success">Hey...! User has been registered!!!</div>
    {% endif %}
    <div class="text-center mb-4">
      <h3 class="h3 mb-3 font-weight-normal">{{helper.translate('Registration')}}</h3>
      <p>Build form controls with floating labels via the <code>:placeholder-shown</code>
        <a href="{{url.get()}}">{{helper.translate('Back to home')}}</a></p>
    </div>

    <div class="form-group">
      <label for="fullName">Full Name</label>
      <input type="text" name="name" id="fullName" class="form-control" placeholder="John Doe" required="required" autocomplete="off">
      {% if messages %}
      <div class="alert alert-danger">{{messages['name']}}</div>
      {% endif %}
    </div>

    <div class="form-group">
      <label for="email">Email address</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="john@doe.com" required="required" autocomplete="off">
      {% if messages %}
      <div class="alert alert-danger">{{messages['email']}}</div>
      {% endif %}
    </div>

    <div class="form-group">
      <label for="phone">Phone</label>
      <input type="text" id="phone" name="phone" class="form-control" placeholder="+998901234567" required="required" autocomplete="off">
      {% if messages %}
      <div class="alert alert-danger">{{messages['phone']}}</div>
      {% endif %}
    </div>

    <div class="form-group">
      <label for="inputPass">Password</label>
      <input type="password" name="password" id="inputPass" class="form-control" placeholder="Password" required="required" autocomplete="off">
      {% if messages %}
      <div class="alert alert-danger">{{messages['password']}}</div>
      {% endif %}
    </div>

    <div class="form-group">
      <label for="repeatPass">Confirm Password</label>
      <input type="password" name="confirmpassword" id="repeatPass" class="form-control" placeholder="Password" required="required" autocomplete="off">
      {% if messages %}
      <div class="alert alert-danger">{{messages['password']}}</div>
      {% endif %}
    </div>

    <hr>
    <button class="btn btn-lg btn-primary btn-block" type="submit">{{helper.translate('Register')}}</button>
    {# <p class="text-center">OR</p> #}
    <a class="btn btn-lg btn-success btn-block" href="{{url.get()}}admin/index/login">{{helper.translate('Enter')}}</a>
    <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2018</p>
  </form>
</div><!-- /. container -->
