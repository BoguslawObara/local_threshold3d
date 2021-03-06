# local_threshold3d
3d local thresholding of an image<br/>

| INPUT | OUTPUT |
| ------------- | ------------- |
| <img src="https://github.com/BoguslawObara/local_threshold3d/blob/master/im/coral.png" width="250">  | <img src="https://github.com/BoguslawObara/local_threshold3d/blob/master/im/coral_s.png" width="250"> |

Thresholding methods:
- mean
- median
- mid grey
- niblack
- bernsen
- sauvola

TODO:
- median method: 'ordfilt3' function must handle user-defined neighborhood

If you find this code useful in your research and development, please consider citing:

    @article{Obara2013c,
        author      = {Boguslaw Obara and Mark Roberts and Judy Armitage and Vicente Grau},
        title       = {Bioimage informatics approach for bacterial cells identification in {Differential Interference Contrast} microscopy images},
        journal     = {BMC Bioinformatics},
        volume      = {14},
        number      = {134},
        year        = {2013}
    }

    @article{Scales2013,
        author      = {Timothy M.E. Scales and Boguslaw Obara and Mark R. Holt and Neil A. Hotchin and Fedor Berditchevski and Maddy Parsons},
        title       = {$\alpha$3$\beta$1 integrins regulate {CD151} complex assembly and membrane dynamics of carcinoma cells within {3D} environments},
        journal     = {Oncogene},
        volume      = {32},
        number      = {34},
        pages       = {3965-3979},
        year        = {2013}
    }
