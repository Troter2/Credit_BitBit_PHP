<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row">
        <div class="col col-sm-12 col-md-4 col-lg-3">
            <img src="https://www.xatobaxestion.com/wp-content/uploads/2016/09/default-user-img.jpg" class="w-100" alt="">
        </div>
        <!-- <div class="modal fade hide" id="myModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">×</a>
                <h3>Modal header</h3>
            </div>
            <div class="modal-body">
                <p>One fine body…</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
            </div>
        </div>
        <script type="text/javascript">
            $(window).on('load', function() {
                $('#myModal').modal('show');
            });
        </script> -->
        <div class="col col-sm-12 col-md-8 col-lg-9 row">
            <div class="font-weight-bold container" style="font-size:26px;"><?php echo $user->first_name . " " . $user->last_name ?> <a href="<?php echo base_url('/userEdit') ?>"><i class="fa fa-edit"></i></a></div>
            <div class="font-weight-bold mt-0 text-primary font-weight-bold container" style="font-size:22px;"><?php echo $group[0]->description; ?></div>

            <div class="row container">
                <div class="col col-sm-6 font-weight-bold">
                    <span>Nom d'usuari</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->username ?></span>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Nom</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->first_name ?></span>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Cognoms</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->last_name ?></span>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Contrasenya</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <a class="btn btn-primary text-white" href="<?php echo base_url('/passEdit') ?>">Modifica contrasenya</a>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Email</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->email ?></span>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Phone</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->phone ?></span>
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Group</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold" style="font-size:18px;">
                    <span><?php echo $user->first_name ?></span>
                </div>

            </div>
        </div>
    </div>
</div>