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
                    <img src="<?php echo base_url("assets/img/carrousel/banner_2.jpg") ?>" class="d-block w-100 carrousel_image img-fluid" alt="Sample image">
                </div>
                <div class="carousel-item">
                    <img src="<?php echo base_url("assets/img/carrousel/banner_1.jpg") ?>" class="d-block w-100 carrousel_image img-fluid" alt="Sample image">
                </div>
                <div class="carousel-item">
                    <img src="<?php echo base_url("assets/img/carrousel/banner_3.jpg") ?>" class="d-block w-100 carrousel_image img-fluid" alt="Sample image">
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
    <?php if ($this->ion_auth->logged_in()) { ?>

    <?php } else { ?>
        <div class="col col-sm-12 col-md-12 row">
            <?php
        }
        if (isset($news)) {
            foreach ($news as $new) {
            ?>


                <div class="col col-sm-12 col-md-4 col-lg-3">




                    <div class="card m-2 " onclick=" location.href='<?php echo base_url('news/view/' . $new['id']) ?>'">
                        <img src="<?php echo base_url('assets/uploads/files/' . $new['image']); ?>" class="card-img-top" alt="Sample image" />
                        <div class="p-2">
                            <h5 class="mt-2" style="font-weight: 800;"><?php echo $new['title']; ?></h5>
                            <p class="">
                                <?php echo character_limiter($new['content'], 400); ?>
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
</div>