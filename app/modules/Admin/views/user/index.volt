    <div class="container" style="margin-top:84px;">
      <div class="row">
        <main class="col-md-12 ml-sm-auto col-lg-12 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <form action="{{ url.get() }}admin/index/logout" method="post">
                  <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                  <button class="btn btn-sm btn-danger" type="submit">
                    <i class="fa fa-sign-out"></i>
                    Logout
                  </button>
                </form>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
