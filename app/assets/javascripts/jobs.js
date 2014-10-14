$(document).on("focus", "[data-provide~='datepicker']", function(e) {
  return -$(this).datepicker({
    language: "de",
    format: "yyyy-mm-dd",
    weekStart: 1,
    autoclose: true,
    daysOfWeekDisabled: "0,6"
  });
});
