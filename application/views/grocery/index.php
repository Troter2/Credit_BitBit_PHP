
	<div style='height:20px;'></div>  
    <div style=" padding: 10px">
        <?php echo $output; ?>

        </div>
        <?php foreach ($js_files as $file) : ?>
            <script src="<?php echo $file; ?>"></script>
        <?php endforeach; ?>
