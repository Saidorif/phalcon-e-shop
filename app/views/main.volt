<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7 "> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9"> <![endif]-->
<!--[if IE 9]><html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>{{ helper.title().get()|escape }}</title>
  {{ helper.meta().get('description') }}
  {{ helper.meta().getOG('type') }}
  {{ helper.meta().getOG('site_name') }}
  {{ helper.meta().getOG('url') }}
  {{ helper.meta().getOG('title') }}
  {{ helper.meta().getOG('description') }}
  {{ helper.meta().getOG('image') }}
  {{ helper.meta().get('robots') }}

  <link href="/{{ helper.favicon() }}" rel="shortcut icon" type="image/vnd.microsoft.icon">

  <!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="/assets/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="/assets/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="/assets/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="/assets/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="/assets/css/style.css" />
	<link type="text/css" rel="stylesheet" href="/assets/css/custom.css" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="/vendor/js/html5shiv.js"></script>
  <script src="/vendor/js/respond.min.js"></script>
  <![endif]-->

  <!-- jQuery Plugins -->
  <script src="/assets/js/jquery.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>
  <script src="/assets/js/slick.min.js"></script>
  <script src="/assets/js/nouislider.min.js"></script>
  <script src="/assets/js/jquery.zoom.min.js"></script>
  <script src="/assets/js/main.js"></script>
  <script src="/assets/js/card.js"></script>

</head>
<body class="animsition">
    {{ content() }}
</body>
</html>
