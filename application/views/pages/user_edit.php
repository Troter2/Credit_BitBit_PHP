<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row">
        <div class="col col-sm-12 col-md-4 col-lg-3">
            <img src="https://www.xatobaxestion.com/wp-content/uploads/2016/09/default-user-img.jpg" class="w-100" alt="">
        </div>
        <div class="col col-sm-12 col-md-8 col-lg-9 row">
            <div class="font-weight-bold container" style="font-size:26px;"><?php echo $user->username ?></div>
            <div class="font-weight-bold mt-0 text-primary font-weight-bold container" style="font-size:22px;">Tecnic</div>


            <?php echo form_open('updateUser'); ?>

            <div class="row container">
                

                <div class="col col-sm-6 font-weight-bold">
                    <span>Nom</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="text"  class="form-control" name="first_name" id="first_name" value="<?php echo $user->first_name ?>">
                </div>


                <div class="col col-sm-6 font-weight-bold">
                    <span>User Last Name</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="text" class="form-control"  name="last_name" id="last_name" value="<?php echo $user->last_name ?>">
                </div>
                

                <div class="col col-sm-6 font-weight-bold">
                    <span>Email</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="text" class="form-control" name="email" id="email" value="<?php echo $user->email ?>">
                </div>

                <div class="col col-sm-6 font-weight-bold">
                    <span>Phone</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="text" class="form-control"  name="phone" id="phone" value="<?php echo $user->phone ?>">
                </div>
                <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Enviar" />


            </div>
            </form>
        </div>
    </div>
</div>