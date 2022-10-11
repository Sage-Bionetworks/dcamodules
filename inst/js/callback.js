var tbl = $(table.table().node());
var id = tbl.closest('.datatables').attr('id');
function onUpdate(updatedCell, updatedRow, oldValue) {
  var cellinfo = [{
    row: updatedCell.index().row + 1,
    col: updatedCell.index().column + 1,
    value: updatedCell.data()
  }];
  Shiny.setInputValue(id + '_cell_edit:DT.cellInfo', cellinfo);
}
table.MakeCellsEditable({
  onUpdate: onUpdate,
  inputCss: 'my-input-class',
  confirmationButton: {
    confirmCss: 'my-confirm-class',
    cancelCss: 'my-cancel-class'
  },
  inputTypes: [
    {
      column: 1,
      type: 'list',
      options: [
        {value: 'Male', display: 'Male'},
        {value: 'Female', display: 'Female'},
        {value: 'Other', display: 'Other'}
      ]
    },
    {
      column: 3,
      type: 'list',
      options: [
        {value: 'Healthy', display: 'Healthy'},
        {value: 'Cancer', display: 'Cancer'}
      ]
    },
    {
      column: 5,
      type: 'list',
      options: [
        {value: 'Breast', display: 'Breast'},
        {value: 'Lung', display: 'Lung'},
        {value: 'Skin', display: 'Skin'},
        {value: 'Colorectal', display: 'Colorectal'},
        {value: 'Prostate', display: 'Prostate'}
      ]
    },
    {
      column: 6,
      type: 'list',
      options: [
        {value: 'Breast', display: 'Breast'},
        {value: 'Lung', display: 'Lung'},
        {value: 'Skin', display: 'Skin'},
        {value: 'Colorectal', display: 'Colorectal'},
        {value: 'Prostate', display: 'Prostate'}
      ]
    }
  ]
});
