(function ($) {
  //    "use strict";

  /*  Data Table
     -------------*/

  // $('#bootstrap-data-table').DataTable();

  $("#bootstrap-data-table").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });
  $("#bootstrap-data-table-Task").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });
  $("#bootstrap-data-table-Invoices").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });
  $("#bootstrap-data-table-Payments").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });
  $("#bootstrap-data-table-Files").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });
  $("#bootstrap-data-table-Tickets").DataTable({
    lengthMenu: [
      [10, 20, 50, -1],
      [10, 20, 50, "All"],
    ],
  });

  $("#bootstrap-data-table-export").DataTable({
    dom: "lBfrtip",
    lengthMenu: [
      [10, 25, 50, -1],
      [10, 25, 50, "All"],
    ],
    buttons: ["copy", "csv", "excel", "pdf", "print"],
  });
  $("#attendance-data").DataTable({
    dom: "lBfrtip",
    lengthMenu: [
      [10, 25, 50, -1],
      [10, 25, 50, "All"],
    ],
    buttons: ["copy", "csv", "excel", "pdf", "print"],
    bSort: false,
  });

  $("#bootstrap-data-table-nopage-dsc").DataTable({
    dom: "lBfrtip",
    buttons: ["copy", "csv", "excel", "pdf", "print"],
    order: [[0, "desc"]],
    searching: false,
    paging: false,
    info: false,
  });

  $("#bootstrap-data-table-nopage").DataTable({
    dom: "lBfrtip",
    buttons: ["copy", "csv", "excel", "pdf", "print"],
    order: [[0, "asc"]],
    searching: false,
    paging: false,
    info: false,
  });

  $("#bootstrap-data-table-export-visible").DataTable({
    dom: "lBfrtip",
    lengthMenu: [
      [10, 25, 50, -1],
      [10, 25, 50, "All"],
    ],
    buttons: [
      {
        extend: "copy",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "csv",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "excel",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "pdf",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "print",
        exportOptions: {
          columns: ":visible",
        },
      },
      "colvis",
    ],
    stateSave: true,
  });
  $("#bootstrap-data-table-nopage-visible").DataTable({
    dom: "lBfrtip",
    buttons: [
      {
        extend: "copy",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "csv",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "excel",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "pdf",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "print",
        exportOptions: {
          columns: ":visible",
        },
      },
      "colvis",
    ],
    stateSave: true,
    order: [[0, "asc"]],
    searching: false,
    paging: false,
    info: false,
  });

  $("#bootstrap-data-table-pass-visible").DataTable({
    dom: "lBfrtip",
    lengthMenu: [
      [10, 25, 50, -1],
      [10, 25, 50, "All"],
    ],
    buttons: [
      {
        extend: "copy",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "csv",
        exportOptions: {
          columns: ":visible",
        },
      },
      {
        extend: "excel",
        exportOptions: {
          columns: ":visible",
        },
      },
      "colvis",
    ],
    stateSave: true,
  });
  $("#myleaves-data").DataTable({
    initComplete: function () {
      this.api()
        .columns()
        .every(function () {
          var column = this;
          var select = $(
            '<select class="form-control"><option value=""></option></select>'
          )
            .appendTo($(column.footer()).empty())
            .on("change", function () {
              var val = $.fn.dataTable.util.escapeRegex($(this).val());
              column.search(val ? "^" + val + "$" : "", true, false).draw();
            });

          column
            .data()
            .unique()
            .sort()
            .each(function (d, j) {
              select.append('<option value="' + d + '">' + d + "</option>");
            });
        });
    },
    columnDefs: [{ orderable: false, targets: 0 }],
    order: [[1, "asc"]],
  });
})(jQuery);
