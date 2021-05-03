<div class="p-3">
    <?php echo form_open('news/create_news'); ?>
    <div class="input-group ">
        <span class="input-group-text " id="basic-addon3" style="width: 100px;">Titol</span>
        <input type="text" class="form-control" id="title" name="title" aria-describedby="basic-addon3">
    </div>
    <div class="input-group ">
        <span class="input-group-text " id="contingut" style="width: 100px;">Contingut de la noticia</span>
        <textarea class="form-control h-50" id="content" aria-label="With textarea" name="content"></textarea>
    </div>

    <div class="">
    <input type="file" name="image" size="20" />
    </div>

    <div class="d-flex justify-content-center mt-5">
        <input class="btn btn-outline-dark" type="submit" name="submit" value="Enviar" />
    </div>
    </form>
</div>