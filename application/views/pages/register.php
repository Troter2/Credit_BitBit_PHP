<div class="login-div align-self-center">
    <p>
        <?php
        if ($this->session->has_userdata('error')) {
            echo $this->session->flashdata('error');
        }
        ?>
    </p>
    <?php if (validation_errors() != null) { ?>
        <div class="alert alert-danger" role="alert">
            <?php echo validation_errors(); ?>
        </div>
    <?php }?>
    
    <div class="card p-4 col col-sm-10 col-md-8 m-auto">
        <?php echo form_open('login/register'); ?>
        <label for="username">Nom d'usuari*</label>
        <input class="form-control" type="text" name="username" value="" /><br />
        <label for="email">Correu electronic*</label>
        <input class="form-control" type="text" name="email" value="" /><br />
        <label for="pass">Contrasenya*</label>
        <input class="form-control" type="password" name="pass" value="" /><br />
        <label for="name">Nom*</label>
        <input class="form-control" type="text" name="name" value="" /><br />
        <label for="lastname">Cognom*</label>
        <input class="form-control" type="text" name="lastname" value="" /><br />
        <label for="company">Companyia</label>
        <input class="form-control" type="text" name="company" value="" /><br />
        <label for="tlf">Numero telefon</label>
        <input class="form-control" type="text" name="tlf" value="" /><br />
        <label for="tlf">Ciutat</label>
        <input class="form-control" type="text" name="city" value="" /><br />
        <div class="d-flex justify-content-center">
            <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
        </div>
        </form>
    </div>
</div>

<script>
    $('#exampleModal').modal('show')
</script>