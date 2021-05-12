<div class="shadow rounded p-4 col col-sm-12 col-md-10 mx-auto mt-3">
    <div class="row">
            <?php echo form_open('updateInci'); ?>

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
                <input class="btn btn btn-primary mt-3" type="submit" name="submit" value="Enviar" />


            </div>
            </form>
        </div>
    </div>
</div>