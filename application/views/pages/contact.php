<div class="login-div align-self-center">
    <div class="card p-4 col col-sm-10 col-md-8 m-auto">
        <?php echo form_open('login/login'); ?>
        <label for="userpass">Correu electronic</label>
        <input class="form-control" type="text" name="userpass" value="" /><br />
        <label for="user">Assumpte</label>
        <input class="form-control" type="text" name="user" value="" /><br />
        <label for="user">Contingut</label>
        <textarea class="form-control" type="text" name="user"></textarea><br />
        <label for="remember">Tipus de consulta</label>
        <select class="form-control" id="exampleFormControlSelect1">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
        </select>
        <br>
        <div class="d-flex justify-content-center">
            <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
        </div>
        </form>
    </div>
</div>