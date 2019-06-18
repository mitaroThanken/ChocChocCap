var stem = {
  outline: [1.15, 2.98, 3.50 + 2.00],
  offset: [5.70 / 2, 0, (3.50 + 2.00) / 2]
};

function stemOneSide() {
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

function chocStems(){
  var s = stemOneSide();

  return [
    translate(stem.offset, s),
    translate([-1 * stem.offset[0], stem.offset[1], stem.offset[2]], s)
  ];
}

function main(){
  return chocStems();
}