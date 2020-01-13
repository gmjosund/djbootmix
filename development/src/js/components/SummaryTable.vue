<template>
  <table class="col-md-3 col-sm-5 summary-table">
    <tbody>
      <tr>
        <td class="text-primary table-nowrap">
          <span class="full-text">{{ firstValueFullText }}</span>
          <span class="short-text">{{ firstValueShortText }}</span>
        </td>
        <td class="text-primary table-nowrap" v-html="firstValue"></td>
      </tr>
      <tr>
        <td class="text-dark table-nowrap">
          <span class="full-text">{{ differenceFullText }}</span>
          <span class="short-text">{{ differenceShortText }}</span>
        </td>
        <td class="text-dark table-nowrap">
          <span class="percentage" v-html="differencePerc"></span>
          <span class="value" v-html="differenceValue"> </span>
        </td>
      </tr>
      <tr>
        <td class="text-success table-nowrap">
          <span class="full-text">{{ secondValueFullText }}</span>
          <span class="short-text">{{ secondValueShortText }}</span>
        </td>
        <td class="text-success table-nowrap" v-html="secondValue"></td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  name: "SummaryTable",
  props: {
    firstValueFullText: [String, Number],
    firstValueShortText: [String, Number],
    firstValue: [String, Number],
    differenceFullText: [String, Number],
    differenceShortText: [String, Number],
    differencePerc: [String, Number],
    differenceValue: [String, Number],
    secondValueFullText: [String, Number],
    secondValueShortText: [String, Number],
    secondValue: [String, Number],
  }
};
</script>

<style>
.summary-table {
  margin-top: 10px;
}

.summary-table tr td:first-child {
  font-weight: bold;
}

.summary-table td {
  padding: 5px;
}

.table-nowrap {
  white-space: nowrap;
}

.summary-table tr:first-child {
  color: #ff6666;
}

.summary-table tr {
  padding: 10px;
}

.summary-table tr td:nth-child(2) {
  text-align: right;
}

.summary-table .current-currency-values {
  min-width: 90px;
  display: inline-block;
}

@media screen and (max-width: 2680px) {
  .summary-table {
    font-size: 16px !important;
  }
}

@media screen and (max-width: 1400px) {
  .summary-table {
    font-size: 12px !important;
  }
}

@media screen and (max-width: 1030px) {
  .summary-table {
    font-size: 10px !important;
  }
}

@media screen and (max-width: 4680px) {
  .summary-table {
    font-size: 15px;
  }
}

@media screen and (max-width: 1440px) {
  .summary-table {
    font-size: 12px !important;
  }
}
</style>
