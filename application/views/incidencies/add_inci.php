<div class="p-3">
    <div class="card p-4 col col-sm-12 col-md-10 m-auto">
        <p class="m-auto">
            <?php if (isset($error)) {
                echo $error;
            } ?>
        </p>
        <div class="row">
            <p class="m-auto pb-3">Introdueix el codi de referencia
            </p>
        </div>
        <?php echo form_open('user/save_incidencia_bd'); ?>
        <div class="input-group col col-sm-6 m-auto">
            <span class="input-group-text " id="basic-addon3" style="width: 170px;">Codi de referencia</span>
            <input type="text" class="form-control" id="uuid" name="uuid" aria-describedby="basic-addon3">
        </div>
        <div class="d-flex justify-content-center mt-5">
            <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
        </div>
        </form>
    </div>
</div>