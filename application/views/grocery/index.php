	<div style='height:20px;'></div>  
    <div class="row">
    <div style=" padding: 10px" class="col col-sm-12">
        <?php echo $output; ?>

        </div>
        </div>
        <?php foreach ($js_files as $file) : ?>
            <script src="<?php echo $file; ?>"></script>
        <?php endforeach; ?>