(function ($) {
  "use strict";
  $("#visitor-circle").circleProgress({
    value: 0.75,
    size: 100,
    fill: {
      gradient: ["#03a9f5", "#1de9b6"],
    },
  });
  $("#bounce-circle").circleProgress({
    value: 0.75,
    size: 100,
    fill: {
      gradient: ["#03a9f5", "#1de9b6"],
    },
  });
  $("#growth-circle").circleProgress({
    value: 0.75,
    size: 100,
    fill: {
      gradient: ["#03a9f5", "#1de9b6"],
    },
  });
  $("#pageviews-circle").circleProgress({
    value: 0.75,
    size: 100,
    fill: {
      gradient: ["#03a9f5", "#1de9b6"],
    },
  });

  $("#primary-circle-card").circleProgress({
    value: 0.5,
    size: 100,
    fill: {
      gradient: ["#03a9f5"],
    },
  });
  $("#danger-circle-card").circleProgress({
    value: 0.8,
    size: 100,
    fill: {
      gradient: ["#f44236"],
    },
  });
  $("#info-circle-card").circleProgress({
    value: 1,
    size: 100,
    fill: {
      gradient: ["#a389d5"],
    },
  });
  //  Chart-circle
  if ($(".chart-circle").length) {
    $(".chart-circle").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "#e5e9f2",
        lineCap: "round",
      });
    });
  }
  //  Chart-circle
  if ($(".chart-circle-primary").length) {
    $(".chart-circle-primary").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "rgba(51, 102, 255, 0.4)",
        lineCap: "round",
      });
    });
  }

  //  Chart-circle
  if ($(".chart-circle-secondary").length) {
    $(".chart-circle-secondary").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "rgba(254, 127, 0, 0.4)",
        lineCap: "round",
      });
    });
  }

  //  Chart-circle
  if ($(".chart-circle-success").length) {
    $(".chart-circle-success").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "rgba(13, 205, 148, 0.5)",
        lineCap: "round",
      });
    });
  }

  //  Chart-circle
  if ($(".chart-circle-warning").length) {
    $(".chart-circle-warning").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "rgba(247, 40, 74, 0.4)",
        lineCap: "round",
      });
    });
  }

  //  Chart-circle
  if ($(".chart-circle-danger").length) {
    $(".chart-circle-danger").each(function () {
      let $this = $(this);

      $this.circleProgress({
        fill: {
          color: $this.attr("data-color"),
        },
        size: $this.height(),
        startAngle: (-Math.PI / 4) * 2,
        emptyFill: "rgba(247, 40, 74, 0.4)",
        lineCap: "round",
      });
    });
  }
})(jQuery);
