<div class="login-div align-self-center">
    <p>
        <?php
        if ($this->session->has_userdata('error')) {
            echo $this->session->flashdata('error');
        }
        ?>
    </p>
    <div class="card p-4 col col-sm-10 col-md-8 m-auto" >
        <?php echo form_open('login/login'); ?>
        <label for="user">Username</label>
        <input class="form-control" type="text" name="user" value="" /><br />
        <label for="userpass">Pass</label>
        <input class="form-control" type="password" name="userpass" value="" /><br />
        <div class="d-flex justify-content-center">
            <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
        </div>
        </form>
    </div>
</div>