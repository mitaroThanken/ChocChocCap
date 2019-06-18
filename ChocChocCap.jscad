// Choc の柱？の外形および整形後のオフセット
var stem = {
  outline: [1.15, 2.98, 3.50 + 2.00],
  offset: [5.70 / 2, 0, (3.50 + 2.00) / 2]
};

// 柱一本分の定義
function stemOneSide() {
  // 削り出し用の外形定義
  var size = {
    diff: [1.15, 1.49, 3.50 + 2.50],
    diffTrans: [1.15 * 2.50 / 3.00, 0, 0]
  };

  let pole = cube({
    size: stem.outline,
    center: true
  });

  let diffBox = cube({
    size: size.diff,
    center: true
  });

  return difference(
    pole,
    translate(size.diffTrans, diffBox),
    translate([-1 * size.diffTrans[0], size.diffTrans[1], size.diffTrans[2]], diffBox)
  );
}

// Choc 用の柱
function chocStems(){
  // 1本分の定義を引っ張ってきて
  var s = stemOneSide();

  // 中央から左右に移動
  return [
    translate(stem.offset, s),
    translate([-1 * stem.offset[0], stem.offset[1], stem.offset[2]], s)
  ];
}

function main(){
  return chocStems();
}