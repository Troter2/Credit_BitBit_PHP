
            <?php
    foreach ($css_files as $file) : ?>
        <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
        <?php endforeach; ?>


        <div style='height:20px;'></div>  
        <div style=" padding: 10px">
            <?php echo $output; ?>
        </div>

        