$(function () {
  "use strict";
  var d = document.getElementById("chartLine1");
  new Chart(d, {
    type: "line",
    data: {
      labels: [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "July",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      datasets: [
        {
          data: [14, 12, 34, 25, 44, 36, 35, 25, 30, 32, 20, 25],
          borderColor: "#3366ff",
          borderWidth: 1,
          fill: !1,
        },
        {
          data: [35, 30, 45, 35, 55, 40, 10, 20, 25, 55, 50, 45],
          borderColor: "#fe7f00",
          borderWidth: 1,
          fill: !1,
        },
      ],
    },
    options: {
      maintainAspectRatio: !1,
      legend: { display: !1, labels: { display: !1 } },
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: !0,
              fontSize: 10,
              max: 80,
              fontColor: "#b4b7c5",
            },
            gridLines: { color: "rgba(180, 183, 197, 0.4)" },
          },
        ],
        xAxes: [
          {
            ticks: { beginAtZero: !0, fontSize: 11, fontColor: "#b4b7c5" },
            gridLines: { color: "rgba(180, 183, 197, 0.4)" },
          },
        ],
      },
    },
  });
  var d = document.getElementById("chartLine2");
  new Chart(d, {
    type: "line",
    data: {
      labels: [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "July",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      datasets: [
        {
          data: [14, 12, 34, 25, 44, 36, 35, 25, 30, 32, 20, 25],
          borderColor: "#3366ff",
          borderWidth: 1,
          fill: !1,
        },
        {
          data: [35, 30, 45, 35, 55, 40, 10, 20, 25, 55, 50, 45],
          borderColor: "#fe7f00",
          borderWidth: 1,
          fill: !1,
        },
      ],
    },
    options: {
      maintainAspectRatio: !1,
      legend: { display: !1, labels: { display: !1 } },
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: !0,
              fontSize: 10,
              max: 80,
              fontColor: "#b4b7c5",
            },
            gridLines: { color: "rgba(180, 183, 197, 0.4)" },
          },
        ],
        xAxes: [
          {
            ticks: { beginAtZero: !0, fontSize: 11, fontColor: "#b4b7c5" },
            gridLines: { color: "rgba(180, 183, 197, 0.4)" },
          },
        ],
      },
    },
  });
});

var r = {
  series: [74, 35],
  chart: { height: 300, type: "donut" },
  dataLabels: { enabled: !1 },
  legend: { show: !1 },
  stroke: { show: !0, width: 0 },
  plotOptions: {
    pie: {
      donut: {
        size: "80%",
        background: "transparent",
        labels: {
          show: !0,
          name: {
            show: !0,
            fontSize: "29px",
            color: "#6c6f9a",
            offsetY: -10,
          },
          value: {
            show: !0,
            fontSize: "26px",
            color: void 0,
            offsetY: 16,
            formatter: function (e) {
              return e + "%";
            },
          },
          total: {
            show: !0,
            showAlways: !1,
            label: "Total",
            fontSize: "22px",
            fontWeight: 600,
            color: "#373d3f",
          },
        },
      },
    },
  },
  responsive: [{ options: { legend: { show: !1 } } }],
  labels: ["Male", "Female"],
  colors: ["#3366ff", "#fe7f00"],
};
new ApexCharts(document.querySelector("#employees"), r).render();

var ma = {
  series: [74, 35],
  chart: { height: 300, type: "donut" },
  dataLabels: { enabled: !1 },
  legend: { show: !1 },
  stroke: { show: !0, width: 0 },
  plotOptions: {
    pie: {
      donut: {
        size: "80%",
        background: "transparent",
        labels: {
          show: !0,
          name: {
            show: !0,
            fontSize: "29px",
            color: "#6c6f9a",
            offsetY: -10,
          },
          value: {
            show: !0,
            fontSize: "26px",
            color: void 0,
            offsetY: 16,
            formatter: function (e) {
              return e + "%";
            },
          },
          total: {
            show: !0,
            showAlways: !1,
            label: "Total",
            fontSize: "22px",
            fontWeight: 600,
            color: "#373d3f",
          },
        },
      },
    },
  },
  responsive: [{ options: { legend: { show: !1 } } }],
  labels: ["In", "Out"],
  colors: ["#3366ff", "#fe7f00"],
};

((a = document.getElementById("sales-summary")).height = "300"),
  new Chart(a, {
    type: "bar",
    data: {
      labels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
      datasets: [
        {
          label: "This Month",
          data: [27, 50, 28, 50, 18, 30, 22],
          backgroundColor: "#3366ff",
          borderWidth: 2,
          hoverBackgroundColor: "#3366ff",
          hoverBorderWidth: 0,
          borderColor: "#3366ff",
          hoverBorderColor: "#3366ff",
          borderDash: [5, 2],
        },
        {
          label: "Last Month",
          data: [68, 57, 53, 58, 23, 75, 28],
          backgroundColor: "#fe7f00",
          borderWidth: 2,
          hoverBackgroundColor: "#fe7f00",
          hoverBorderWidth: 0,
          borderColor: "#fe7f00",
          hoverBorderColor: "#fe7f00",
        },
        {
          label: "Last Month",
          data: [100, 78, 68, 95, 0, 98, 58],
          backgroundColor: "#dbe2fc",
          borderWidth: 2,
          hoverBackgroundColor: "#dbe2fc",
          hoverBorderWidth: 0,
          borderColor: "#dbe2fc",
          hoverBorderColor: "#dbe2fc",
        },
      ],
    },
    options: {
      responsive: !0,
      maintainAspectRatio: !1,
      layout: { padding: { left: 0, right: 0, top: 0, bottom: 0 } },
      tooltips: { enabled: !1 },
      scales: {
        yAxes: [
          {
            gridLines: {
              display: !0,
              drawBorder: !1,
              zeroLineColor: "rgba(142, 156, 173,0.1)",
              color: "rgba(142, 156, 173,0.1)",
            },
            scaleLabel: { display: !1 },
            ticks: {
              beginAtZero: !0,
              stepSize: 25,
              suggestedMin: 0,
              suggestedMax: 100,
              fontColor: "#8492a6",
              userCallback: function (e) {
                return e.toString() + "%";
              },
            },
          },
        ],
        xAxes: [
          {
            barPercentage: 0.15,
            barValueSpacing: 0,
            barDatasetSpacing: 0,
            barRadius: 0,
            stacked: !0,
            ticks: { beginAtZero: !0, fontColor: "#8492a6" },
            gridLines: { color: "rgba(142, 156, 173,0.1)", display: !1 },
          },
        ],
      },
      legend: { display: !1 },
      elements: { point: { radius: 0 } },
    },
  });

new ApexCharts(document.querySelector("#Meterial"), r).render();
