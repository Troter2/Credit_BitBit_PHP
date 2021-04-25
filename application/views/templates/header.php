<head>
    <link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/mycss.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/style.css'); ?>">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <title>CodeIgniter Tutorial</title>
</head>

<body>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar">
        <script src="<?= base_url('assets/js/bootstrap.js') ?>"></script>
        <?php $this->load->library('session'); ?>
        <!-- Navigation -->
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar" class="active">
                <h1><a href="index.html" class="logo">M.</a></h1>
                <ul class="list-unstyled components mb-5">
                    <li class="active">
                        <a href="<?php echo base_url('/home') ?>"><span class="fa fa-home"></span> Home</a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('/about') ?>"><span class="fa fa-user"></span> About</a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('/status') ?>"><span class="fa fa-sticky-note"></span>Status</a>
                    </li>
                    <li>
                        <a href="<?php echo base_url('/contact') ?>"><span class="fa fa-paper-plane"></span> Contacts</a>
                    </li>
                    <li style="border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                        <div class="btn-group dropright">
                            <a type="button" class="dropdown-toggle " style="width: 100%;border-bottom: 0px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="fa fa-user"></span>Admin
                            </a>
                            <div class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <ul class="pl-1">
                                    <li class="dropdown-item"><a class="text-dark" href="#">Usuaris</a></li>
                                    <li class="dropdown-item"><a class="text-dark" href="#">Correu</a></li>
                                    <li class="dropdown-item"><a class="text-dark" href="#">Modificar Home</a></li>
                                    <li class="dropdown-item"><a class="text-dark" href="#">MODIFICAR OPCIONS CONTACTE</a></li>
                                    <li class="dropdown-item"><a class="text-dark" href="#">dasboard</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="footer">
                    <p>
                        Copyright &copy;<script>
                            document.write(new Date().getFullYear());
                        </script>
                    </p>
                </div>
            </nav>
            <!-- Page Content  -->
            <div id="content" class="pt-4  px-4 ">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="btn btn-primary">
                            <i class="fa fa-bars"></i>
                            <span class="sr-only">Toggle Menu</span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="<?php echo base_url('/home') ?>">Home</a>
                                </li>
                                <?php if (!$this->ion_auth->logged_in()) { ?>
                                    <li class="nav-item ">
                                        <a class="nav-link" href="<?php echo base_url('/login') ?>">Login</a>
                                    </li>
                                    <li class="nav-item ">
                                        <a class="nav-link" href="<?php echo base_url('/register') ?>">Register</a>
                                    </li>
                                <?php } ?>
                                <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url('/about') ?>">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url('/contact') ?>">Contact</a>
                                </li>
                                <?php if ($this->ion_auth->logged_in()) { ?>
                                    <li class="nav-item ">
                                        <a class="nav-link" href="<?php echo base_url('/userProfile') ?>">
                                            <?php
                                            $user = $this->ion_auth->user()->row();
                                            echo $user->username; ?>
                                        </a>
                                    </li>
                                    <li class="nav-item ">
                                        <a class="nav-link" href="<?php echo base_url('/logout') ?>">Logout</a>
                                    </li>
                                <?php }  ?>
                            </ul>
                        </div>
                    </div>
                </nav>