<div class="p-3">
    <?php echo form_open('mail/sendMail'); ?>
    <div class="input-group ">
        <span class="input-group-text " id="basic-addon3" style="width: 100px;">Para</span>
        <input type="text" class="form-control" id="to" name="to" aria-describedby="basic-addon3">
    </div>
    <div class="input-group ">
        <span class="input-group-text " id="basic-addon3" style="width: 100px;">Asunto</span>
        <input type="text" class="form-control " id="basic-url" name="about" aria-describedby="basic-addon3">
    </div>
    <div class="">
        <textarea class="form-control h-50" aria-label="With textarea" name="content"></textarea>
    </div>

    <div class="d-flex justify-content-center mt-5">
        <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
    </div>
    </form>
</div>