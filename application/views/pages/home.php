<div class="row py-4">
    <div class="col col-sm-12 mb-5 h-50">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active ">
                    <img src="https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg" class="d-block w-100 h-100 img-fluid" alt="Sample image">
                </div>
                <div class="carousel-item">
                    <img src="https://fujifilm-x.com/wp-content/uploads/2019/08/x-t30_sample-images02.jpg" class="d-block w-100 h-100 img-fluid" alt="Sample image">
                </div>
                <div class="carousel-item">
                    <img src="https://www.phe.es/wp-content/uploads/2017/03/mt-sample-background-e1496164073121.jpg" class="d-block w-100 h-100 img-fluid" alt="Sample image">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="col col-sm-7 col-md-8 row">
        <?php
        if (isset($news)) {
            foreach ($news as $new) {
        ?>
                <div class="col col-sm-12 col-md-6 col-lg-4">
                    <div class="card m-2 cutNews">
                        <img src="<?php echo base_url('assets/uploads/files/' . $new['image']); ?>" class="card-img-top" alt="Sample image" />
                        <div class="p-2">
                            <h5 class=""><?php echo $new['title']; ?></h5>
                            <p class="">
                                <?php echo $new['content']; ?>
                            </p>
                        </div>
                        <p class="pl-2">
                            <?php echo $new['date']; ?>
                        </p>
                    </div>
                </div>
        <?php
            }
        }
        ?>
    </div>
    <div class="col col-sm-6 col-md-4 ml-1 card p-0 container-fluid row">

        <div class=" border p-3 ">Missatges</div>
        <div class=" border  " style="cursor: pointer;" onclick=" location.href='<?php echo base_url('mail/send') ?>'">Missatge nou</div>
        <div class="py-3 px-2">

            <?php
            if (isset($messages)) {
                foreach ($messages as $msg) {
                    if ($msg['recive_date'] != NULL) {
            ?>
                        <div class="mb-1 p-2 bg-light border text-truncate" style="cursor: pointer;" onclick=" location.href='<?php echo base_url('mail/view/' . $msg['id_msg']) ?>'"><span class="fa fa-envelope-open-o  mr-3"></span> <?php echo $msg['about']; ?></div>
                    <?php
                    } else { ?>

                        <div class="mb-1 p-2 bg-light border text-truncate" style="cursor: pointer;" onclick=" location.href='<?php echo base_url('mail/view/' . $msg['id_msg']) ?>'"><span class="fa fa-envelope  mr-3"></span> <?php echo $msg['about']; ?></div>
            <?php
                    }
                }
            }
            ?>
        </div>
    </div>
</div>