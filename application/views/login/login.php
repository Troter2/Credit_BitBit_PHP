<div class="login-div align-self-center">
    <p>
        <?php
        if ($this->session->has_userdata('error')) {
            echo $this->session->flashdata('error');
        }
        ?>
    </p>
    <?php echo form_open('login/index'); ?>
    <label for="username">Username</label>
    <input class="form-control" type="text" name="username" value="" /><br />
    <label for="userpass">Pass</label>
    <input class="form-control" type="password" name="userpass" value="" /><br />
    <div class="d-flex justify-content-center">
        <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
    </div>
    </form>
</div>