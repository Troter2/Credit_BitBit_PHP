<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row">
        <div class="col col-sm-12 col-md-4 col-lg-3">
            <img src="https://www.xatobaxestion.com/wp-content/uploads/2016/09/default-user-img.jpg" class="w-100" alt="">
        </div>
        <div class="col col-sm-12 col-md-8 col-lg-9 row">
            <div class="font-weight-bold container" style="font-size:26px;"><?php echo $user->username ?></div>
            <div class="font-weight-bold mt-0 text-primary font-weight-bold container" style="font-size:22px;">Tecnic</div>


            <?php echo form_open('updatePass'); ?>

            <div class="row container">
                

                <div class="col col-sm-6 font-weight-bold">
                    <span>Contrasenya antiga</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="password" class="form-control"  name="oldPass" id="oldPass" value="">
                </div>
                <div class="col col-sm-6 font-weight-bold">
                    <span>Contrasenya nova</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="password" class="form-control"  name="newPass" id="newPass" value="">
                </div>
                <div class="col col-sm-6 font-weight-bold">
                    <span>Repeteix la contrasenya</span>
                </div>

                <div class="col col-sm-6 text-primary font-weight-bold py-1" style="font-size:18px;">
                    <input type="password" class="form-control"  name="repeatPass" id="repeatPass" value="">
                </div>
                <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Enviar" />


            </div>
            </form>
        </div>
    </div>
</div>