<div class="login-div align-self-center">
    <div class="container">
        <div class="row">
            <div class="col">
                <button id="changeInfoButton" type="button" class="btn btn-info col col-sm-10 col-md-12 m-auto" onclick="switchVisible();">Info</button>
            </div>
        </div>
    </div>


    <div class="card p-4 col col-sm-10 col-md-8 m-auto">
        <div id="contentForm">
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
        <div id="contentMap" hidden='true' class="card p-4 col col-sm-10 col-md-8 m-auto">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2109.8061915993235!2d0.5823671224248058!3d41.597014830046355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a72021d046cd1d%3A0x96462cdd6272567a!2sIES%20CAPARRELLA!5e0!3m2!1ses!2ses!4v1618500024616!5m2!1ses!2ses" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>
</div>