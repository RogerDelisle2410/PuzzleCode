<!DOCTYPE html>
<%--Roger Puzzle in Javascript  Latest--%>
<style type="text/css">
	html > body .grad1 {
		background: cyan; /* For browsers that do not support gradients */
		background: -webkit-linear-gradient(cyan, lightblue); /* For Safari 5.1 to 6.0 */
		background: -o-linear-gradient(cyan, lightblue); /* For Opera 11.1 to 12.0 */
		background: -moz-linear-gradient(cyan, lightblue); /* For Firefox 3.6 to 15 */
		background: linear-gradient(cyan, lightblue); /* Standard syntax (must be last ) */
	}
	.normal {
		-ms-transform: rotate(0);
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
	}

	img {
		max-width: 100% !important;
		height: auto;
		display: block;
		float: left;
		width: 20%;
	}

	body {
		/*min-width: 300px;*/
		max-width: 1050px;
		max-height: 900px;
		 /*height:auto;
		width:auto;*/
	}

	button {
		height: 22px;
		text-align: center;
	}

	.arrowAlign {
		float: left;
		margin-left: -90px;
	}

	.perspective {
		transform: perspective( 500px ) rotateY( 160deg );
		position: absolute;
		opacity: .6;
		margin-left: -35px;
		width: auto;
		height: auto;
		top: -35px;
	}

	.imgContainer {
		float: left;
	}

	#myAnimation {
		width: 84px;
		height: 59px;
		position: absolute;
		background-color: red;
	}

	div.ImageFront4b {
	/*	content: url("Images/Coke-1-0.png");*/
		content: url("Images/Coke-1-0.png");
	}
	.arrow {
		/*background-color: black;*/
		position: absolute;
		display: inline-block;
		/*border-radius: 50%;*/
	}
</style>
 <div id="canvas" style="position: relative"></div>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<html xmlns="http://www.w3.org/1999/xhtml">

	<script src="Scripts/jquery-1.9.1.js"></script>
	<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<script src="Scripts/jquery-1.9.1.js"></script>
	<script src="Scripts/jquery-1.9.1.min.js"></script>
	<script src="Scripts/jquery-1.9.1.intellisense.js"></script>
	<script src="Scripts/bootstrap.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>

<head runat="server">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link href="Content/bootstrap.css" rel="stylesheet" />
	<title>Puzzle in JavaScript</title>
</head>

<script type="text/javascript">
    /*var oldCan = "Coke";*/
    var oldCan = "Coke";
    var saveNewCan;
    var pBoxDisplayId;
    var pBoxNewCanId;
    var cid = 1;
    var cidImage = 1;
    var image;
    var image0;
    var image1;
    var image2;
    var image3;
    var image4;
    var image5;
    var verifyResult = 0;
    var theBox = 0;
    var theDirection;

    var buttonRight1Style;
    var buttonLeft1Style;
    var buttonRight2Style;
    var buttonLeft2Style;
    var buttonRight3Style;
    var buttonLeft3Style;
    var buttonRight1Value;
    var buttonLeft1Value;
    var buttonRight2Value;
    var buttonLeft2Value;
    var buttonRight3Value;
    var buttonLeft3Value;

    var buttonDown1Style;
    var buttonUp1Style;
    var buttonDown2Style;
    var buttonUp2Style;
    var buttonDown3Style;
    var buttonUp3Style;
    var buttonDown1Value;
    var buttonUp1Value;
    var buttonDown2Value;
    var buttonUp2Value;
    var buttonDown3Value;
    var buttonUp3Value;

    var hard = "false";
    var NumOfClick;
    var numberOfClickDone;
    var NumAllowed = 2;
    var numAllowedDone;
    var LastButton;

    var colChanges1 = new Array(7);
    colChanges1 = [0, 6, 1, 2, 3, 4, 5];

    var colChanges2 = new Array(7);
    colChanges2 = [0, 2, 3, 4, 5, 6, 1];


    var arrImages = new Array(6);
    for (var i = 0; i < 6; i++) {
        arrImages[i] = new Array(6);
    }

    var arrImagesCol = new Array(8);
    for (var i = 0; i < 8; i++) {
        arrImagesCol[i] = new Array(8);
    }

    var arrOriginal = new Array(8);
    for (var i = 0; i < 8; i++) {
        arrOriginal[i] = new Array(8);
    }

    var arrUndo = new Array(8);
    for (var i = 0; i < 8; i++) {
        arrUndo[i] = new Array(8);
    }

    var arrChangedtabindex = new Array(8);
    for (var i = 0; i < 8; i++) {
        arrChangedtabindex[i] = new Array(8);
    }

    var arrChangedImage = new Array(8);
    for (var i = 0; i < 8; i++) {
        arrChangedImage[i] = new Array(8);
    }

    window.opener = self;
    /*  window.close();*/

    window.onload = function () {
        window.pBoxNewCanId = [
            [
                document.getElementById('ImageFront1').id,
                document.getElementById('ImageFront2').id,
                document.getElementById('ImageFront3').id,
                document.getElementById('ImageBack3').id,
                document.getElementById('ImageBack2').id,
                document.getElementById('ImageBack1').id
            ],
            [
                document.getElementById('ImageFront4').id,
                document.getElementById('ImageFront5').id,
                document.getElementById('ImageFront6').id,
                document.getElementById('ImageBack6').id,
                document.getElementById('ImageBack5').id,
                document.getElementById('ImageBack4').id
            ],
            [
                document.getElementById('ImageFront7').id,
                document.getElementById('ImageFront8').id,
                document.getElementById('ImageFront9').id,
                document.getElementById('ImageBack9').id,
                document.getElementById('ImageBack8').id,
                document.getElementById('ImageBack7').id
            ],
            [
                document.getElementById('ImageFront10').id,
                document.getElementById('ImageFront11').id,
                document.getElementById('ImageFront12').id,
                document.getElementById('ImageBack12').id,
                document.getElementById('ImageBack11').id,
                document.getElementById('ImageBack10').id
            ],
            [
                document.getElementById('ImageFront13').id,
                document.getElementById('ImageFront14').id,
                document.getElementById('ImageFront15').id,
                document.getElementById('ImageBack15').id,
                document.getElementById('ImageBack14').id,
                document.getElementById('ImageBack13').id
            ],
            [
                document.getElementById('ImageFront16').id,
                document.getElementById('ImageFront17').id,
                document.getElementById('ImageFront18').id,
                document.getElementById('ImageBack18').id,
                document.getElementById('ImageBack17').id,
                document.getElementById('ImageBack16').id
            ],
            [
                document.getElementById('ImageFront19').id,
                document.getElementById('ImageFront20').id,
                document.getElementById('ImageFront21').id,
                document.getElementById('ImageBack21').id,
                document.getElementById('ImageBack20').id,
                document.getElementById('ImageBack19').id
            ],
            [
                document.getElementById('ImageFront22').id,
                document.getElementById('ImageFront23').id,
                document.getElementById('ImageFront24').id,
                document.getElementById('ImageBack24').id,
                document.getElementById('ImageBack23').id,
                document.getElementById('ImageBack22').id
            ]
        ];

        window.pBoxDisplayId = [
            [
                document.getElementById('ImageFront1').id,
                document.getElementById('ImageFront2').id,
                document.getElementById('ImageFront3').id,
                document.getElementById('ImageBack3').id,
                document.getElementById('ImageBack2').id,
                document.getElementById('ImageBack1').id
            ],
            [
                document.getElementById('ImageFront4').id,
                document.getElementById('ImageFront5').id,
                document.getElementById('ImageFront6').id,
                document.getElementById('ImageBack6').id,
                document.getElementById('ImageBack5').id,
                document.getElementById('ImageBack4').id
            ],
            [
                document.getElementById('ImageFront7').id,
                document.getElementById('ImageFront8').id,
                document.getElementById('ImageFront9').id,
                document.getElementById('ImageBack9').id,
                document.getElementById('ImageBack8').id,
                document.getElementById('ImageBack7').id
            ],
            [
                document.getElementById('ImageFront10').id,
                document.getElementById('ImageFront11').id,
                document.getElementById('ImageFront12').id,
                document.getElementById('ImageBack12').id,
                document.getElementById('ImageBack11').id,
                document.getElementById('ImageBack10').id
            ],
            [
                document.getElementById('ImageFront13').id,
                document.getElementById('ImageFront14').id,
                document.getElementById('ImageFront15').id,
                document.getElementById('ImageBack15').id,
                document.getElementById('ImageBack14').id,
                document.getElementById('ImageBack13').id
            ],
            [
                document.getElementById('ImageFront16').id,
                document.getElementById('ImageFront17').id,
                document.getElementById('ImageFront18').id,
                document.getElementById('ImageBack18').id,
                document.getElementById('ImageBack17').id,
                document.getElementById('ImageBack16').id
            ],
            [
                document.getElementById('ImageFront19').id,
                document.getElementById('ImageFront20').id,
                document.getElementById('ImageFront21').id,
                document.getElementById('ImageBack21').id,
                document.getElementById('ImageBack20').id,
                document.getElementById('ImageBack19').id
            ],
            [
                document.getElementById('ImageFront22').id,
                document.getElementById('ImageFront23').id,
                document.getElementById('ImageFront24').id,
                document.getElementById('ImageBack24').id,
                document.getElementById('ImageBack23').id,
                document.getElementById('ImageBack22').id
            ]
        ];

        saveOriginalImage();
        reloadOriginalImage();
        retrieveButtons();
        window.buttonColor1.style.background = "";
        window.buttonColor2.style.background = "";
        window.buttonColor3.style.background = "";
        window.buttonColor4.style.background = "";
        window.buttonColor5.style.background = "";
        document.getElementById('LabelGoodWork').style.display = 'none';
    }

    function saveOriginalImage() {
        for (var row = 0; row < 8; row++) {
            retrieveRow2(row);
            for (var column = 0; column < 6; column++) {
                window.arrOriginal[row][column] = { src: document.getElementById(arrImages[column]).src, index: document.getElementById(arrImages[column]).tabIndex };
            }
        }
    }

    function reloadOriginalImage() {
        for (var row = 0; row < 8; row++) {
            retrieveRow2(row);
            for (var column = 0; column < 6; column++) {
                document.getElementById(arrImages[column]).src = window.arrOriginal[row][column]['src'];
            }
        }

        saveOriginalImage();
        saveChangeImage();

        VerifyPuzzle();
        retrieveButtons();
        window.buttonColor1.style.background = "green";
        window.buttonColor2.style.background = "";
        window.buttonColor3.style.background = "";
        window.buttonColor4.style.background = "";
        window.buttonColor5.style.background = "";

        resetButton();
        window.hard = "false";
        document.getElementById('LabelGoodWork').style.display = 'none';
    }

    function changeCanImage(newCan) {

        reloadOriginalImage();

        var img = document.getElementById('Mirror');
        if (newCan === "Canadian" || newCan === "RedBull") {
            img.src = 'MirrorLong.png';
        } else {
            img.src = 'MirrorShort.png';
        }

        for (var row = 0; row < 8; row++) {
            retrieveNewCanRow2(row);
            for (var column = 0; column < 6; column++) {
                document.getElementById(arrImages[column]).src = document.getElementById(arrImages[column]).src.replace(window.oldCan, newCan);
            }
        }

        window.oldCan = newCan;
        window.saveNewCan = newCan;
        saveOriginalImage();
        saveChangeImage();
        VerifyPuzzle();
    }

    function saveImagesForUndo() {
        for (var row = 0; row < 8; row++) {
            retrieveRow2(row);
            for (var column = 0; column < 6; column++) {
                window.arrUndo[row][column] = { src: document.getElementById(arrImages[column]).src, index: document.getElementById(arrImages[column]).tabIndex };
            }
        }

        var buttonRight1Visibility = document.getElementById('buttonRight1');
        var buttonLeft1Visibility = document.getElementById('buttonLeft1');
        var buttonRight2Visibility = document.getElementById('buttonRight2');
        var buttonLeft2Visibility = document.getElementById('buttonLeft2');
        var buttonRight3Visibility = document.getElementById('buttonRight3');
        var buttonLeft3Visibility = document.getElementById('buttonLeft3');

        buttonRight1Style = window.getComputedStyle(buttonRight1Visibility);
        buttonRight1Value = buttonRight1Style.getPropertyValue('visibility');

        buttonLeft1Style = window.getComputedStyle(buttonLeft1Visibility);
        buttonLeft1Value = buttonLeft1Style.getPropertyValue('visibility');

        buttonRight2Style = window.getComputedStyle(buttonRight2Visibility);
        buttonRight2Value = buttonRight2Style.getPropertyValue('visibility');

        buttonLeft2Style = window.getComputedStyle(buttonLeft2Visibility);
        buttonLeft2Value = buttonLeft2Style.getPropertyValue('visibility');

        buttonRight3Style = window.getComputedStyle(buttonRight3Visibility);
        buttonRight3Value = buttonRight3Style.getPropertyValue('visibility');

        buttonLeft3Style = window.getComputedStyle(buttonLeft3Visibility);
        buttonLeft3Value = buttonLeft3Style.getPropertyValue('visibility');

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        var buttonDown1Visibility = document.getElementById('buttonMoveDown1');
        var buttonUp1Visibility = document.getElementById('buttonMoveUp1');
        var buttonDown2Visibility = document.getElementById('buttonMoveDown2');
        var buttonUp2Visibility = document.getElementById('buttonMoveUp2');
        var buttonDown3Visibility = document.getElementById('buttonMoveDown3');
        var buttonUp3Visibility = document.getElementById('buttonMoveUp3');

        buttonDown1Style = window.getComputedStyle(buttonDown1Visibility);
        buttonDown1Value = buttonDown1Style.getPropertyValue('visibility');

        buttonUp1Style = window.getComputedStyle(buttonUp1Visibility);
        buttonUp1Value = buttonUp1Style.getPropertyValue('visibility');

        buttonDown2Style = window.getComputedStyle(buttonDown2Visibility);
        buttonDown2Value = buttonDown2Style.getPropertyValue('visibility');

        buttonUp2Style = window.getComputedStyle(buttonUp2Visibility);
        buttonUp2Value = buttonUp2Style.getPropertyValue('visibility');

        buttonDown3Style = window.getComputedStyle(buttonDown3Visibility);
        buttonDown3Value = buttonDown3Style.getPropertyValue('visibility');

        buttonUp3Style = window.getComputedStyle(buttonUp3Visibility);
        buttonUp3Value = buttonUp3Style.getPropertyValue('visibility');

        numberOfClickDone = window.NumOfClick;
        numAllowedDone = window.NumAllowed;
    }

    function UndoLastMove() {
        retrieveArrowButtonsUpDown();
        retrieveArrowButtonsLeftRight();

        for (var row = 0; row < 8; row++) {
            retrieveRow2(row);
            for (var column = 0; column < 6; column++) {
                document.getElementById(arrImages[column]).src = window.arrUndo[row][column]['src'];
                document.getElementById(arrImages[column]).tabIndex = window.arrUndo[row][column]['index'];
            }
        }
        window.buttonRight.style.visibility = buttonRight1Value;
        window.buttonLeft1.style.visibility = buttonLeft1Value;
        window.buttonRight2.style.visibility = buttonRight2Value;
        window.buttonLeft2.style.visibility = buttonLeft2Value;
        window.buttonRight3.style.visibility = buttonRight3Value;
        window.buttonLeft3.style.visibility = buttonLeft3Value;

        window.buttonMoveDown1.style.visibility = buttonDown1Value;
        window.buttonMoveUp1.style.visibility = buttonUp1Value;
        window.buttonMoveDown2.style.visibility = buttonDown2Value;
        window.buttonMoveUp2.style.visibility = buttonUp2Value;
        window.buttonMoveDown3.style.visibility = buttonDown3Value;
        window.buttonMoveUp3.style.visibility = buttonUp3Value;

        window.NumOfClick = numberOfClickDone - 1;
        window.NumAllowed = numAllowedDone;
        saveChangeImage();
        VerifyPuzzle();
    }

    function saveChangeImage() {
        for (var row = 0; row < 8; row++) {
            retrieveRow2(row);
            for (var column = 0; column < 6; column++) {
                window.arrChangedImage[row][column] = { src: document.getElementById(arrImages[column]).src, index: document.getElementById(arrImages[column]).tabIndex };
            }
        }
    }

    function btnSaveCurrentGame() {

        for (var row = 0; row < 8; row++) {
            retrieveNewCanRow2(row);
            for (var column = 0; column < 6; column++) {
                localStorage.setItem('src' + column + row, document.getElementById(arrImages[column]).src.toString());
                localStorage.setItem('index' + column + row, document.getElementById(arrImages[column]).tabIndex.toString());
            }
        }

        var buttonRight1Visibility = document.getElementById('buttonRight1');
        var buttonLeft1Visibility = document.getElementById('buttonLeft1');
        var buttonRight2Visibility = document.getElementById('buttonRight2');
        var buttonLeft2Visibility = document.getElementById('buttonLeft2');
        var buttonRight3Visibility = document.getElementById('buttonRight3');
        var buttonLeft3Visibility = document.getElementById('buttonLeft3');

        buttonRight1Style = window.getComputedStyle(buttonRight1Visibility);
        localStorage.setItem('buttonRight1Value', buttonRight1Style.getPropertyValue('visibility'));

        buttonLeft1Style = window.getComputedStyle(buttonLeft1Visibility);
        localStorage.setItem('buttonLeft1Value', buttonLeft1Style.getPropertyValue('visibility'));

        buttonRight2Style = window.getComputedStyle(buttonRight2Visibility);
        localStorage.setItem('buttonRight2Value', buttonRight2Style.getPropertyValue('visibility'));

        buttonLeft2Style = window.getComputedStyle(buttonLeft2Visibility);
        localStorage.setItem('buttonLeft2Value', buttonLeft2Style.getPropertyValue('visibility'));

        buttonRight3Style = window.getComputedStyle(buttonRight3Visibility);
        localStorage.setItem('buttonRight3Value', buttonRight3Style.getPropertyValue('visibility'));

        buttonLeft3Style = window.getComputedStyle(buttonLeft3Visibility);
        localStorage.setItem('buttonLeft3Value', buttonLeft3Style.getPropertyValue('visibility'));

        //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        var buttonDown1Visibility = document.getElementById('buttonMoveDown1');
        var buttonUp1Visibility = document.getElementById('buttonMoveUp1');
        var buttonDown2Visibility = document.getElementById('buttonMoveDown2');
        var buttonUp2Visibility = document.getElementById('buttonMoveUp2');
        var buttonDown3Visibility = document.getElementById('buttonMoveDown3');
        var buttonUp3Visibility = document.getElementById('buttonMoveUp3');

        buttonDown1Style = window.getComputedStyle(buttonDown1Visibility);
        localStorage.setItem('buttonDown1Value', buttonDown1Style.getPropertyValue('visibility'));

        buttonUp1Style = window.getComputedStyle(buttonUp1Visibility);
        localStorage.setItem('buttonUp1Value', buttonUp1Style.getPropertyValue('visibility'));

        buttonDown2Style = window.getComputedStyle(buttonDown2Visibility);
        localStorage.setItem('buttonDown2Value', buttonDown2Style.getPropertyValue('visibility'));

        buttonUp2Style = window.getComputedStyle(buttonUp2Visibility);
        localStorage.setItem('buttonUp2Value', buttonUp2Style.getPropertyValue('visibility'));

        buttonDown3Style = window.getComputedStyle(buttonDown3Visibility);
        localStorage.setItem('buttonDown3Value', buttonDown3Style.getPropertyValue('visibility'));

        buttonUp3Style = window.getComputedStyle(buttonUp3Visibility);
        localStorage.setItem('buttonUp3Value', buttonUp3Style.getPropertyValue('visibility'));

        localStorage.setItem('buttonTooEasy', document.getElementById('buttonTooEasy').style.backgroundColor);
        localStorage.setItem('buttonEasy', document.getElementById('buttonEasy').style.backgroundColor);
        localStorage.setItem('buttonHard', document.getElementById('buttonHard').style.backgroundColor);
        localStorage.setItem('buttonXtraHard', document.getElementById('buttonXtraHard').style.backgroundColor);
        localStorage.setItem('btnLoadImage', document.getElementById('btnLoadImage').style.backgroundColor);

        localStorage.setItem('NumOfClick', window.NumOfClick);
        localStorage.setItem('NumAllowed', window.NumAllowed);
        localStorage.setItem('hard', window.hard);
        localStorage.setItem('oldCan', window.oldCan);
    }

    function btnLoadSavedGame() {

        window.saveNewCan = localStorage.getItem('oldCan');
        if (window.saveNewCan != null) {
            changeCanImage(window.saveNewCan);

            for (var row = 0; row < 8; row++) {
                retrieveNewCanRow2(row);
                for (var column = 0; column < 6; column++) {
                    document.getElementById(arrImages[column]).src = localStorage.getItem('src' + column + row);
                    document.getElementById(arrImages[column]).tabIndex = localStorage.getItem('index' + column + row);
                }
            }

            window.buttonRight1.style.visibility = localStorage.getItem('buttonRight1Value');
            window.buttonLeft1.style.visibility = localStorage.getItem('buttonLeft1Value');
            window.buttonRight2.style.visibility = localStorage.getItem('buttonRight2Value');
            window.buttonLeft2.style.visibility = localStorage.getItem('buttonLeft2Value');
            window.buttonRight3.style.visibility = localStorage.getItem('buttonRight3Value');
            window.buttonLeft3.style.visibility = localStorage.getItem('buttonLeft3Value');

            window.buttonMoveDown1.style.visibility = localStorage.getItem('buttonDown1Value');
            window.buttonMoveUp1.style.visibility = localStorage.getItem('buttonUp1Value');
            window.buttonMoveDown2.style.visibility = localStorage.getItem('buttonDown2Value');
            window.buttonMoveUp2.style.visibility = localStorage.getItem('buttonUp2Value');
            window.buttonMoveDown3.style.visibility = localStorage.getItem('buttonDown3Value');
            window.buttonMoveUp3.style.visibility = localStorage.getItem('buttonUp3Value');

            document.getElementById('buttonTooEasy').style.backgroundColor = localStorage.getItem('buttonTooEasy');
            document.getElementById('buttonEasy').style.backgroundColor = localStorage.getItem('buttonEasy');
            document.getElementById('buttonHard').style.backgroundColor = localStorage.getItem('buttonHard');
            document.getElementById('buttonXtraHard').style.backgroundColor = localStorage.getItem('buttonXtraHard');
            document.getElementById('btnLoadImage').style.backgroundColor = localStorage.getItem('btnLoadImage');

            window.NumOfClick = localStorage.getItem('NumOfClick');
            window.NumAllowed = localStorage.getItem('NumAllowed');
            window.hard = localStorage.getItem('hard');
            saveChangeImage();
            VerifyPuzzle();
        }
    }

    function reply(clickedTabIndex, clickedAlt) {
        if (clickedAlt + clickedTabIndex !== window.LastButton) {
            window.NumOfClick = 0;
            window.LastButton = clickedAlt + clickedTabIndex;
            window.NumOfClick++;
        }
        else {
            window.NumOfClick++;
        }

        if (clickedAlt === "side") {
            switch (clickedTabIndex) {
                case 1:
                    MoveRight(clickedTabIndex);
                    break;
                case 2:
                    MoveLeft(clickedTabIndex);
                    break;
                case 3:
                    MoveRight(clickedTabIndex);
                    break;
                case 4:
                    MoveLeft(clickedTabIndex);
                    break;
                case 5:
                    MoveRight(clickedTabIndex);
                    break;
                case 6:
                    MoveLeft(clickedTabIndex);
                    break;
            }
        }

        if (clickedAlt === "up") {
            switch (clickedTabIndex) {
                case 0:
                    MoveDown(clickedTabIndex);
                    break;
                case 1:
                    MoveUp(clickedTabIndex);
                    break;
                case 2:
                    MoveDown(clickedTabIndex);
                    break;
                case 3:
                    MoveUp(clickedTabIndex);
                    break;
                case 4:
                    MoveDown(clickedTabIndex);
                    break;
                case 5:
                    MoveUp(clickedTabIndex);
                    break;
            }
        }
        if (hard === "true") {
            if (NumOfClick >= NumAllowed) {
                switch (clickedAlt) {
                    case "side":
                        BlockMovementSide(clickedTabIndex);
                    case "up":
                        BlockMovementTop(clickedTabIndex);
                }
            }
        }
    }

    function BlockMovementSide(x) {
        retrieveArrowButtonsLeftRight();
        window.buttonRight1.style.visibility = '';
        window.buttonLeft1.style.visibility = '';
        window.buttonRight2.style.visibility = '';
        window.buttonLeft2.style.visibility = '';
        window.buttonRight3.style.visibility = '';
        window.buttonLeft3.style.visibility = '';

        switch (x) {
            case 0:
                window.buttonLeft1.style.visibility = 'hidden';
                window.buttonLeft3.style.visibility = 'hidden';
                window.buttonRight1.style.visibility = 'hidden';
                break;
            case 1:
                window.buttonRight1.style.visibility = 'hidden';
                window.buttonRight2.style.visibility = 'hidden';
                window.buttonLeft1.style.visibility = 'hidden';
                break;
            case 2:
                window.buttonLeft1.style.visibility = 'hidden';
                window.buttonLeft2.style.visibility = 'hidden';
                window.buttonRight2.style.visibility = 'hidden';
                break;
            case 3:
                window.buttonRight2.style.visibility = 'hidden';
                window.buttonRight3.style.visibility = 'hidden';
                window.buttonLeft2.style.visibility = 'hidden';
                break;
            case 4:
                window.buttonLeft2.style.visibility = 'hidden';
                window.buttonLeft3.style.visibility = 'hidden';
                window.buttonRight3.style.visibility = 'hidden';
                break;
            case 5:
                window.buttonRight1.style.visibility = 'hidden';
                window.buttonRight3.style.visibility = 'hidden';
                window.buttonLeft3.style.visibility = 'hidden';
        }
    }

    function resetButton() {
        retrieveArrowButtonsUpDown();
        retrieveArrowButtonsLeftRight();

        window.buttonRight1.style.visibility = '';
        window.buttonLeft1.style.visibility = '';
        window.buttonRight2.style.visibility = '';
        window.buttonLeft2.style.visibility = '';
        window.buttonRight3.style.visibility = '';
        window.buttonLeft3.style.visibility = '';

        window.buttonMoveDown1.style.visibility = '';
        window.buttonMoveUp1.style.visibility = '';
        window.buttonMoveDown2.style.visibility = '';
        window.buttonMoveUp2.style.visibility = '';
        window.buttonMoveDown3.style.visibility = '';
        window.buttonMoveUp3.style.visibility = '';

    }

    function BlockMovementTop(x) {
        retrieveArrowButtonsUpDown();
        window.buttonMoveDown1.style.visibility = '';
        window.buttonMoveUp1.style.visibility = '';
        window.buttonMoveDown2.style.visibility = '';
        window.buttonMoveUp2.style.visibility = '';
        window.buttonMoveDown3.style.visibility = '';
        window.buttonMoveUp3.style.visibility = '';

        switch (x) {
            case 0:
                window.buttonMoveUp1.style.visibility = 'hidden';
                window.buttonMoveUp3.style.visibility = 'hidden';
                window.buttonMoveDown1.style.visibility = 'hidden';
                break;
            case 1:
                window.buttonMoveDown1.style.visibility = 'hidden';
                window.buttonMoveDown2.style.visibility = 'hidden';
                window.buttonMoveUp1.style.visibility = 'hidden';
                break;
            case 2:
                window.buttonMoveUp1.style.visibility = 'hidden';
                window.buttonMoveUp2.style.visibility = 'hidden';
                window.buttonMoveDown2.style.visibility = 'hidden';
                break;
            case 3:
                window.buttonMoveDown1.style.visibility = 'hidden';
                window.buttonMoveDown3.style.visibility = 'hidden';
                window.buttonMoveUp3.style.visibility = 'hidden';
                break;
            case 4:
                window.buttonMoveUp2.style.visibility = 'hidden';
                window.buttonMoveUp3.style.visibility = 'hidden';
                window.buttonMoveDown3.style.visibility = 'hidden';
                break;
            case 5:
                window.buttonMoveDown2.style.visibility = 'hidden';
                window.buttonMoveDown3.style.visibility = 'hidden';
                window.buttonMoveUp2.style.visibility = 'hidden';
                break;
        }
    }

    function retrieveButtons() {
        window.buttonColor1 = document.getElementById('buttonTooEasy');
        window.buttonColor2 = document.getElementById('buttonEasy');
        window.buttonColor3 = document.getElementById('buttonHard');
        window.buttonColor4 = document.getElementById('buttonXtraHard');
        window.buttonColor5 = document.getElementById('btnLoadImage');
        window.buttonColor1.style.background = "";
        window.buttonColor2.style.background = "";
        window.buttonColor3.style.background = "";
        window.buttonColor4.style.background = "";
        window.buttonColor5.style.background = "";
    }

    function retrieveArrowButtonsLeftRight() {
        window.buttonRight1 = document.getElementById('buttonRight1');
        window.buttonLeft1 = document.getElementById('buttonLeft1');
        window.buttonRight2 = document.getElementById('buttonRight2');
        window.buttonLeft2 = document.getElementById('buttonLeft2');
        window.buttonRight3 = document.getElementById('buttonRight3');
        window.buttonLeft3 = document.getElementById('buttonLeft3');
    }

    function retrieveArrowButtonsUpDown() {
        window.buttonMoveDown1 = document.getElementById('buttonMoveDown1');
        window.buttonMoveUp1 = document.getElementById('buttonMoveUp1');
        window.buttonMoveDown2 = document.getElementById('buttonMoveDown2');
        window.buttonMoveUp2 = document.getElementById('buttonMoveUp2');
        window.buttonMoveDown3 = document.getElementById('buttonMoveDown3');
        window.buttonMoveUp3 = document.getElementById('buttonMoveUp3');
    }

    function btnTooEasy() {

        reloadOriginalImage();
        saveOriginalImage();
        saveChangeImage();
        VerifyPuzzle();
        retrieveButtons();
        window.buttonColor1.style.background = "green";
        window.hard = "false";
    }

    function btnEasy() {

        reloadOriginalImage();
        ShuffleTheCan();
        retrieveButtons();
        window.buttonColor2.style.background = "green";
        window.hard = "false";
        window.NumAllowed = 1000;
    }

    function btnHard() {
        reloadOriginalImage();
        ShuffleTheCan();
        retrieveButtons();
        window.buttonColor3.style.background = "green";
        window.hard = "true";
        window.NumAllowed = 2;
    }

    function closeMe() {
        //  window.opener = self;
        window.close();
    }


    function btnXtraHard() {
        reloadOriginalImage();
        ShuffleTheCan();
        retrieveButtons();
        window.buttonColor4.style.background = "green";
        window.hard = "true";
        window.NumAllowed = 1;
    }

    function ShuffleTheCan() {

        var random1 = Math.random() * (6 - 1);
        for (var x = 0; x < random1; x++) {
            var y = x + 1;
            if (y >= 6) {
                y = 0;
            }

            MoveLeft(y);
            MoveUp(y);
            MoveLeft(y);
        }
        saveChangeImage();
        saveImagesForUndo();
        VerifyPuzzle();
    }


    //function MoveRight(row) {
    //    retrieveRow2(row);
    //    theDirection = false;

    //    for (x = 0; x < 6; x++) {
    //        var elem = document.getElementById(arrImages[x]); //test

    //        var ol = document.getElementById(arrImages[x]).offsetLeft;
    //        var ot = document.getElementById(arrImages[x]).offsetTop;
    //        var wdt = document.getElementById(arrImages[x]).offsetWidth;
    //        var ttab = document.getElementById(arrImages[x]).tabIndex;

    //     //   document.getElementById("TextBox" + x).value = (document.getElementById(arrImages[x]).id + '=' + "Left" + '=' + ol + '= Top' + ot + '=' + "width:" + wdt);
    //        myMoveRight(arrImages[x], ol, wdt, ttab);
    //    }

    //    loadImage(arrImages[2], arrImages[5]);
    //    saveChangeImage();
    //    VerifyPuzzle();
    //}

    //function MoveLeft(row) {
    //    retrieveRow2(row);
    //    theDirection = false;

    //    for (x = 0; x < 6; x++) {
    //        var elem = document.getElementById(arrImages[x]);

    //        var ol = document.getElementById(arrImages[x]).offsetLeft;
    //        var ot = document.getElementById(arrImages[x]).offsetTop;
    //        var wdt = document.getElementById(arrImages[x]).offsetWidth;
    //        var ttab = document.getElementById(arrImages[x]).tabIndex;

    //        document.getElementById("TextBox" + x).value = (document.getElementById(arrImages[x]).id + '=' + "Left" + '=' + ol + '= Top' + ot + '=' + "width:" + wdt);
    //        myMoveLeft(arrImages[x], ol, wdt, ttab);
    //    }

    //    loadImage(arrImages[2], arrImages[5]);
    //    saveChangeImage();
    //    VerifyPuzzle();
    //}

    //function myMoveRight(image, ol, wdt, ttab) {
    //    var elem = document.getElementById(image);
    //    var pos = ol;
    //    var id = setInterval(frame, 41);
    //    function frame() {
    //        if (ttab < 25) {
    //            if (pos == (ol + wdt)) {
    //                clearInterval(id);
    //            } else {
    //                pos++;
    //                elem.style.position = "absolute";
    //                elem.style.left = pos + 'px';
    //            }
    //        }
    //        else {
    //            if (pos == (ol - wdt)) {
    //                clearInterval(id);
    //            } else {
    //                pos--;
    //                elem.style.position = "absolute";
    //                elem.style.left = pos + 'px';
    //            }
    //        }
    //    }
    //}

    //function myMoveLeft(image, ol, wdt, ttab) {
    //    var elem = document.getElementById(image);
    //    var pos = ol;
    //    var id = setInterval(frame, 1);
    //    function frame() {
    //        if (ttab > 24) {
    //            if (pos == (ol + wdt)) {
    //                clearInterval(id);
    //            } else {
    //                pos++;
    //                elem.style.position = "absolute";
    //                elem.style.left = pos + 'px';
    //            }
    //        }
    //        else {
    //            if (pos == (ol - wdt)) {
    //                clearInterval(id);
    //            } else {
    //                pos--;
    //                elem.style.position = "absolute";
    //                elem.style.left = pos + 'px';
    //            }
    //        }
    //    }
    //}

    function MoveRight(row) {
        saveImagesForUndo();
        retrieveRow(row);

        document.getElementById(image1).src = window.arrChangedImage[row][0]['src'];
        document.getElementById(image2).src = window.arrChangedImage[row][1]['src'];
        document.getElementById(image3).src = window.arrChangedImage[row][2]['src'];
        document.getElementById(image4).src = window.arrChangedImage[row][3]['src'];
        document.getElementById(image5).src = window.arrChangedImage[row][4]['src'];
        document.getElementById(image0).src = window.arrChangedImage[row][5]['src'];

        document.getElementById(image1).tabIndex = window.arrChangedImage[row][0]['index'];
        document.getElementById(image2).tabIndex = window.arrChangedImage[row][1]['index'];
        document.getElementById(image3).tabIndex = window.arrChangedImage[row][2]['index'];
        document.getElementById(image4).tabIndex = window.arrChangedImage[row][3]['index'];
        document.getElementById(image5).tabIndex = window.arrChangedImage[row][4]['index'];
        document.getElementById(image0).tabIndex = window.arrChangedImage[row][5]['index'];

        // moveArrow(image3);
        loadImage(image3, image0);
        saveChangeImage();
        VerifyPuzzle();
    }

    function MoveLeft(row) {
        saveImagesForUndo();
        retrieveRow(row);

        document.getElementById(image1).src = window.arrChangedImage[row][2]['src'];
        document.getElementById(image0).src = window.arrChangedImage[row][1]['src'];
        document.getElementById(image5).src = window.arrChangedImage[row][0]['src'];
        document.getElementById(image4).src = window.arrChangedImage[row][5]['src'];
        document.getElementById(image3).src = window.arrChangedImage[row][4]['src'];
        document.getElementById(image2).src = window.arrChangedImage[row][3]['src'];

        document.getElementById(image1).tabIndex = window.arrChangedImage[row][2]['index'];
        document.getElementById(image0).tabIndex = window.arrChangedImage[row][1]['index'];
        document.getElementById(image5).tabIndex = window.arrChangedImage[row][0]['index'];
        document.getElementById(image4).tabIndex = window.arrChangedImage[row][5]['index'];
        document.getElementById(image3).tabIndex = window.arrChangedImage[row][4]['index'];
        document.getElementById(image2).tabIndex = window.arrChangedImage[row][3]['index'];

        loadImage(image2, image5);
        saveChangeImage();
        VerifyPuzzle();
    }

    function loadImage(flipImage1, flipImage2) {

        var canv3 = document.createElement('canvas');
        canv3.id = 'someId3' + cid;
        cid++;

        var ctx3 = canv3.getContext('2d');
        document.body.appendChild(canv3);

        var img3 = new Image();
        img3.src = document.getElementById(flipImage1).src;

        var w3 = img3.width;
        canv3.height = img3.height;
        canv3.width = img3.width;

        ctx3.save();
        ctx3.scale(-1, 1);
        ctx3.translate(-w3, 0);
        ctx3.drawImage(img3, 0, 0);

        document.getElementById(flipImage1).src = canv3.toDataURL();

        //++++++++++++++++++++++++++++++++++++++++++

        var canv4 = document.createElement('canvas');
        canv4.id = 'someId4' + cid;
        cid++;

        var ctx4 = canv4.getContext('2d');
        document.body.appendChild(canv4);

        var img4 = new Image();
        img4.src = document.getElementById(flipImage2).src;
        canv4.height = img4.height;
        canv4.width = img4.width;
        var w4 = img4.width;

        ctx4.save();
        ctx4.scale(-1, 1);
        ctx4.translate(-w4, 0);
        ctx4.drawImage(img4, 0, 0);
        document.getElementById(flipImage2).src = canv4.toDataURL();
        saveChangeImage();

        ctx3.clearRect(0, 0, canv3.width, canv3.height);
        ctx4.clearRect(0, 0, canv4.width, canv4.height);
    }

    function MoveDown(col) {
        saveImagesForUndo();
        retrieveCol(col);
        document.getElementById(image1).src = window.arrChangedImage[6][col]['src'];
        document.getElementById(image2).src = window.arrChangedImage[1][col]['src'];
        document.getElementById(image3).src = window.arrChangedImage[2][col]['src'];
        document.getElementById(image4).src = window.arrChangedImage[3][col]['src'];
        document.getElementById(image5).src = window.arrChangedImage[4][col]['src'];
        document.getElementById(image6).src = window.arrChangedImage[5][col]['src'];

        document.getElementById(image1).tabIndex = window.arrChangedImage[6][col]['index'];
        document.getElementById(image2).tabIndex = window.arrChangedImage[1][col]['index'];
        document.getElementById(image3).tabIndex = window.arrChangedImage[2][col]['index'];
        document.getElementById(image4).tabIndex = window.arrChangedImage[3][col]['index'];
        document.getElementById(image5).tabIndex = window.arrChangedImage[4][col]['index'];
        document.getElementById(image6).tabIndex = window.arrChangedImage[5][col]['index'];
        saveChangeImage();

        VerifyPuzzle();
    }

    function MoveUp(col) {
        saveImagesForUndo();
        retrieveCol(col);
        document.getElementById(image1).src = window.arrChangedImage[2][col]['src'];
        document.getElementById(image2).src = window.arrChangedImage[3][col]['src'];
        document.getElementById(image3).src = window.arrChangedImage[4][col]['src'];
        document.getElementById(image4).src = window.arrChangedImage[5][col]['src'];
        document.getElementById(image5).src = window.arrChangedImage[6][col]['src'];
        document.getElementById(image6).src = window.arrChangedImage[1][col]['src'];

        document.getElementById(image1).tabIndex = window.arrChangedImage[2][col]['index'];
        document.getElementById(image2).tabIndex = window.arrChangedImage[3][col]['index'];
        document.getElementById(image3).tabIndex = window.arrChangedImage[4][col]['index'];
        document.getElementById(image4).tabIndex = window.arrChangedImage[5][col]['index'];
        document.getElementById(image5).tabIndex = window.arrChangedImage[6][col]['index'];
        document.getElementById(image6).tabIndex = window.arrChangedImage[1][col]['index'];
        saveChangeImage();

        VerifyPuzzle();
    }

    function retrieveNewCanRow2(row) {
        for (var x = 0; x < 6; x++) {
            arrImages[x] = window.pBoxNewCanId[row][x].split(" ");
        }
    }

    function retrieveRow(row) {
        for (var x = 0; x < 6; x++) {
            image0 = window.pBoxDisplayId[row][0].split(" ");
            image1 = window.pBoxDisplayId[row][1].split(" ");
            image2 = window.pBoxDisplayId[row][2].split(" ");
            image3 = window.pBoxDisplayId[row][3].split(" ");
            image4 = window.pBoxDisplayId[row][4].split(" ");
            image5 = window.pBoxDisplayId[row][5].split(" ");
        }
    }

    function retrieveRow2(row) {
        for (var x = 0; x < 6; x++) {
            arrImages[x] = window.pBoxDisplayId[row][x].split(" ");
        }
    }

    function retrieveCol(col) {
        image0 = window.pBoxDisplayId[0][col].split(" ");
        image1 = window.pBoxDisplayId[1][col].split(" ");
        image2 = window.pBoxDisplayId[2][col].split(" ");
        image3 = window.pBoxDisplayId[3][col].split(" ");
        image4 = window.pBoxDisplayId[4][col].split(" ");
        image5 = window.pBoxDisplayId[5][col].split(" ");
        image6 = window.pBoxDisplayId[6][col].split(" ");
        image7 = window.pBoxDisplayId[7][col].split(" ");
    }

    function VerifyPuzzle() {
        window.verifyResult = -12;

        for (var x = 0; x < 8; x++) {
            retrieveRow2(x);
            for (var column = 0; column < 6; column++) {
                if (window.arrOriginal[x][column]['index'] === document.getElementById(arrImages[column]).tabIndex) { window.verifyResult++; }
                if (window.verifyResult === 36) {
                    document.getElementById('theTextBox').value = window.verifyResult.toString();
                    document.getElementById('LabelGoodWork').style.display = 'inherit';
                } else {

                    document.getElementById('theTextBox').value = window.verifyResult.toString();
                    document.getElementById('LabelGoodWork').style.display = 'none';
                }
            }
        }
    }

    var position = [];
    var canvas_context = [];
    var canvas = [];
    var theImage = [];
    var arrow = [];

    function moveArrow(image3) {

        for (var x = 1; x < 13; x++) {
            canvas[x] = document.createElement("canvas");
            canvas[x].id = "canvasid" + x;
            canvas[x].style.display = "none";

            canvas_context[x] = canvas[x].getContext("2d");
            var image = new Image();
            image.src = document.getElementById(image3).src;  //"Coke-5-4.png"; //"rightArrow.png";
            document.body.appendChild(canvas[x]);

            var imgHeight = image.height;
            var imgWidth = image.width;
            var cutWidth = imgWidth / 12;
            //  alert(image.height + '=' + cutWidth);

            canvas[x].width = image.width / 12;
            canvas[x].height = imgHeight;
            document.body.appendChild(canvas[x]);
            canvas_context[x].drawImage(image, cutWidth * (x - 1), 0, imgWidth, imgHeight, 0, 0, imgWidth, imgHeight);
            eval(window.position[x] + "=" + 1);
        }

        for (var x = 1; x < 13; x++) {
            theImage[x] = new Image();
        }
        for (var x = 1; x < 13; x++) {
            canvas[x] = document.getElementById("canvasid" + x);
        }
        for (var x = 1; x < 13; x++) {
            theImage[x].src = canvas[x].toDataURL();
        }
        for (var x = 1; x < 13; x++) {
            arrow[x] = Arrow.create(theImage[x].src, 1, 2);
        }
        for (var x = 1; x < 13; x++) {
            arrow[x].draw(((7 * x) + 5), 20);
        }
    }

    var canvas = {
        element: document.getElementById('canvas'),
        width: 800,
        height: 400,
        initialize: function () {
            this.element.style.width = this.width + 'px';
            this.element.style.height = this.height + 'px';
            this.element.style.visibility = "none";
            document.body.appendChild(this.element);
        }
    };

    var Arrow = {
        create: function (cutArrow, dx, dy) {
            var arrow = Object.create(this);
            arrow.dx = dx;
            arrow.element = new Image();
            arrow.element.src = cutArrow;

            arrow.element.className += ' arrow';
            canvas.element.appendChild(arrow.element);
            return arrow;
        },
        moveTo: function (x, y) {
            for (var xds = 1; xds < 13; xds++) {
                this.element.style.left = x + 'px';
            }
        },
        changeDirectionIfNecessary: function (arrow, arrowdx, x, y) {
            if (arrowdx != -1) {
                arrow.element.style.transform = "rotateY(180deg)";
            } else {
                arrow.element.style.transform = "rotateY(0deg)";
            }
            this.dx = -this.dx;
        },
        draw: function (x, y) {
            this.moveTo(x, y);
            var arrow = this;
            setTimeout(function () {
                if (x === 300) {
                    x = x + 200;
                    arrow.changeDirectionIfNecessary(arrow, arrow.dx, x, y);
                }
                arrow.draw(x + arrow.dx, y + arrow.dy);
            }, 500 / 60);
        }
    };

</script>
	

<body>
	<form   runat="server">
	<%--		<button onclick="openWin()">Open "myWindow"</button>
	<button onclick="closeWin()">Close "myWindow"</button>--%>
		<div class="container-fluid">

			<div class="row">
				<div class=" col-xs-12 col-sm-12 col-md-12" style="height: 20px;">
					<%--<div class="ImageFront4b" id="ImageFront4b" style="width: 84px; height: 59px;  position: absolute;"></div>--%>
					<%--<img src="Images/Coke-1-0.png" id="ImageFront4b" tabindex="444" class="img-responsive" alt="My Image" style="width: 84px; height: 59px;" />--%>
				</div>
			</div>
			<div class="row  container-fluid">
				<div class=" col-xs-2 col-sm-2 col-md-2">
					<div class="row  " style="margin-bottom: -13px;">
						<div>
							<button type="button" id="ButtonUndo" runat="server" onclick="UndoLastMove(); return false;" style="height: 40px; width: 100px;" class="img-responsive">Undo last Move</button>
						</div>
					</div>
				</div>
				<div class=" col-xs-4 col-sm-4 col-md-4">
					<img src="downArrow.t.bmp" id="buttonMoveDown1" class=" img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="0" visible="True" />
					<img src="upArrow.t.bmp" id="buttonMoveUp1" class="img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="1" visible="True" />
					<img src="downArrow.t.bmp" id="buttonMoveDown2" class="img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="2" visible="True" />

				</div>
				<div class=" col-xs-4 col-sm-4 col-md-4" style="margin-left: -40px">
					<img src="upArrow.t.bmp" id="buttonMoveUp2" class=" img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="5" visible="True" />
					<img src="downArrow.t.bmp" id="buttonMoveDown3" class="img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="4" visible="True" />
					<img src="upArrow.t.bmp" id="buttonMoveUp3" class=" img-responsive " onclick="reply(this.tabIndex, this.alt )" alt="up" tabindex="3" visible="True" />

				</div>
				<div class=" col-xs-2 col-sm-2 col-md-2">
					<asp:Label ID="LabelGoodWork" runat="server" Text="Good Work!" Style="width: 100px; display: none; font-weight: bold"></asp:Label>
				</div>
			</div>

			<div class="row  container-fluid">
				<div class=" col-xs-12 col-sm-12 col-md-12" style="height: 20px;">
				</div>
			</div>
			<div class="row  container-fluid">
				<div class=" col-xs-2 col-sm-2 col-md-2">
				</div>

				<div id="ImageFrontContainer" class="col-xs-4 col-sm-4 col-md-4  container-fluid">
					<div class="row">
						<div>
							<img src="Images/Coke-0-0.png" id="ImageFront1" tabindex="1" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-0-1.png" id="ImageFront2" tabindex="2" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-0-2.png" id="ImageFront3" tabindex="3" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="rightArrow.t.bmp" id="buttonRight1" class="img-responsive  arrowAlign " onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="1" visible="True" />
							<img src="Images/Coke-1-0.png" id="ImageFront4" tabindex="4" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-1-1.png" id="ImageFront5" tabindex="5" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-1-2.png" id="ImageFront6" tabindex="6" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="leftArrow.t.bmp" id="buttonLeft1" class="img-responsive  arrowAlign" onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="2" visible="True" />
							<img src="Images/Coke-2-0.png" id="ImageFront7" tabindex="7" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-2-1.png" id="ImageFront8" tabindex="8" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-2-2.png" id="ImageFront9" tabindex="9" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="rightArrow.t.bmp" id="buttonRight2" class="img-responsive  arrowAlign " onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="3" visible="True" />
							<img src="Images/Coke-3-0.png" id="ImageFront10" tabindex="10" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-3-1.png" id="ImageFront11" tabindex="11" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-3-2.png" id="ImageFront12" tabindex="12" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="leftArrow.t.bmp" id="buttonLeft2" class="img-responsive  arrowAlign" onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="4" visible="True" />
							<img src="Images/Coke-4-0.png" id="ImageFront13" tabindex="13" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-4-1.png" id="ImageFront14" tabindex="14" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-4-2.png" id="ImageFront15" tabindex="15" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="rightArrow.t.bmp" id="buttonRight3" class="img-responsive  arrowAlign " onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="5" visible="True" />
							<img src="Images/Coke-5-0.png" id="ImageFront16" tabindex="16" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-5-1.png" id="ImageFront17" tabindex="17" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-5-2.png" id="ImageFront18" tabindex="18" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>
							<img src="leftArrow.t.bmp" id="buttonLeft3" class="img-responsive  arrowAlign" onclick="reply(this.tabIndex, this.alt )" alt="side" tabindex="6" visible="True" />
							<img src="Images/Coke-6-0.png" id="ImageFront19" tabindex="19" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-6-1.png" id="ImageFront20" tabindex="20" class="img-responsive" alt="My Image" />
							<img src="Images/Coke-6-2.png" id="ImageFront21" tabindex="21" class="img-responsive" alt="My Image" />
						</div>
					</div>
					<div class="row">
						<div>

							<img src="Images/Coke-7-0.png" id="ImageFront22" tabindex="22" class="img-responsive " alt="My Image" />
							<img src="Images/Coke-7-1.png" id="ImageFront23" tabindex="23" class="img-responsive " alt="My Image" />
							<img src="Images/Coke-7-2.png" id="ImageFront24" tabindex="24" class="img-responsive " alt="My Image" />
						</div>
					</div>
				</div>


				<div id="ImageBackContainer" class=" col-xs-4 col-sm-4 col-md-4  container-fluid">
					<div class="row " style="padding-top: 30px;">
						<asp:Image ID="Mirror" runat="server" ImageUrl="MirrorShort.png" class="img-responsive " BorderStyle="Solid" BorderColor="Red"
							Style="border: 5px solid black; transform: perspective( 400px ) rotateY( 160deg ); position: absolute; perspective-origin: 25% 75%; opacity: .4; margin-left: -55px; width: auto; height: auto; top: 5px;" />

						<div>
							<img src="Images/Coke-0-3.png" id="ImageBack1" tabindex="25" />
							<img src="Images/Coke-0-4.png" id="ImageBack2" tabindex="26" />
							<img src="Images/Coke-0-5.png" id="ImageBack3" tabindex="27" />
						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-1-3.png" id="ImageBack4" tabindex="28" />
							<img src="Images/Coke-1-4.png" id="ImageBack5" tabindex="29" />
							<img src="Images/Coke-1-5.png" id="ImageBack6" tabindex="30" />
						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-2-3.png" id="ImageBack7" tabindex="31" />
							<img src="Images/Coke-2-4.png" id="ImageBack8" tabindex="32" />
							<img src="Images/Coke-2-5.png" id="ImageBack9" tabindex="33" />
						</div>
					</div>

					<div class="row  ">
						<div>
							<img src="Images/Coke-3-3.png" id="ImageBack10" tabindex="34" />
							<img src="Images/Coke-3-4.png" id="ImageBack11" tabindex="35" />
							<img src="Images/Coke-3-5.png" id="ImageBack12" tabindex="36" />
						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-4-3.png" id="ImageBack13" tabindex="37" />
							<img src="Images/Coke-4-4.png" id="ImageBack14" tabindex="38" />
							<img src="Images/Coke-4-5.png" id="ImageBack15" tabindex="39" />
						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-5-3.png" id="ImageBack16" tabindex="40" />
							<img src="Images/Coke-5-4.png" id="ImageBack17" tabindex="41" />
							<img src="Images/Coke-5-5.png" id="ImageBack18" tabindex="42" />
						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-6-3.png" id="ImageBack19" tabindex="43" />
							<img src="Images/Coke-6-4.png" id="ImageBack20" tabindex="44" />
							<img src="Images/Coke-6-5.png" id="ImageBack21" tabindex="45" />

						</div>
					</div>
					<div class="row  ">
						<div>
							<img src="Images/Coke-7-3.png" id="ImageBack22" tabindex="46" />
							<img src="Images/Coke-7-4.png" id="ImageBack23" tabindex="47" />
							<img src="Images/Coke-7-5.png" id="ImageBack24" tabindex="48" />

						</div>
					</div>
				</div>
				<div class=" col-xs-2 col-sm-2 col-md-2  "> <%--container-fluid--%>
					<div class="row" style="margin-left: 10px;">
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="theTextBox" runat="server" Width="40px"></asp:TextBox>
									</td>
									<td>
										<asp:Label ID="aLabel" runat="server" Text="&nbsp; of 36"></asp:Label>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row" style="margin-bottom: -13px;">
							<div>
								<button id="buttonTooEasy" runat="server" onclick="btnTooEasy(); return false;" style="width: 100px;" class="img-responsive elButton">Practice</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="buttonEasy" runat="server" onclick="btnEasy(); return false;" style="width: 100px;" class="img-responsive">Easy</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="buttonHard" runat="server" onclick="btnHard(); return false;" style="width: 100px;" class="img-responsive">Hard</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="buttonXtraHard" runat="server" onclick="btnXtraHard(); return false;" style="width: 100px;" class="img-responsive">Xtra Hard</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="btnLoadImage" runat="server" onclick="reloadOriginalImage(); return false;" style="width: 100px;" class="img-responsive">Reload</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="btnSave" runat="server" onclick="btnSaveCurrentGame();" style="width: 100px;" class="img-responsive">Save Current Game</button>
							</div>
						</div>
						<br />

						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="btnReloadSaved" runat="server" onclick="btnLoadSavedGame();" style="width: 100px;" class="img-responsive">Load Last Saved Game</button>
							</div>
						</div>
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>
								<button type="button" id="buttonExit" runat="server" onclick="closeMe()" style="width: 100px;" class="img-responsive">Close</button>
							</div>
						</div> 
						<br />
						<div class="row  " style="margin-bottom: -13px;">
							<div>

								<label>Change Can</label>
								<%--<asp:TextBox ID="TextBox6" runat="server" Width="50px"></asp:TextBox>--%>
								<%--<asp:TextBox ID="TextBox7" runat="server" Width="50px"></asp:TextBox>--%>
								<select id="listofcans" onchange="changeCanImage(this.value)">
									<option value="Coke">Coke</option>	
									<option value="CokePepsi">CokePepsi</option>
									<option value="Kokanee">Kokanee</option> 						
									<option value="Canadian">Canadian</option>
									<option value="RedBull">RedBull</option>
									<option value="Campbell">Campbell</option>
									<option value="Grasshopper">Grasshopper</option>
									<option value="MillerLite">MillerLite</option>
									<option value="PeopleBeer">PeopleBeer</option>
								</select>
							</div>
						</div>
						<br />
						<%--<img src="Images/Coke-7-3.png" id="ImageBack122" tabindex="46" class="" />
						<br />--%>
						<%--   <div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox0" runat="server" Width="300px"></asp:TextBox>
										<asp:TextBox ID="TextBox7" runat="server" Width="24px"></asp:TextBox>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
										<asp:TextBox ID="TextBox7" runat="server" Width="24px"></asp:TextBox>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox>
										<asp:TextBox ID="TextBox8" runat="server" Width="24px"></asp:TextBox>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox>
										<asp:TextBox ID="TextBox9" runat="server" Width="24px"></asp:TextBox>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox>
										<asp:TextBox ID="TextBox10" runat="server" Width="24px"></asp:TextBox>
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="row">
							<table>
								<tr>
									<td>
										<asp:TextBox ID="TextBox5" runat="server" Width="300px"></asp:TextBox>

									</td>
								</tr>
							</table>
						</div>--%>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
