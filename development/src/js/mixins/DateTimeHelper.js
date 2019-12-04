import { mapGetters } from 'vuex';
import { DEFAULT_DATE_FORMAT, DEFAULT_VALUE, FLAGS } from '../helpers/constants';

export default {
  computed: {
    ...mapGetters({
      serverSettings: "monitoring/settings"
    })
  },
  data() {
    return {
      currentDateFormat: '',
    }
  },
  methods: {
    getCurrentDateFormat() {
      let currentRegion = this.serverSettings.hasOwnProperty('language') ? this.serverSettings.language : 'ENGB';
      currentRegion = currentRegion.toLowerCase();
      if (FLAGS.hasOwnProperty(currentRegion)) {
        this.currentDateFormat = FLAGS[currentRegion];
      }
      return this.currentDateFormat;
    },
    getDateObj(data, timeZoneOffset, isUTC) {
      if (!data) {
        return '';
      }
      const offset = this.getOffset(timeZoneOffset);
      let date = null;
      if (data instanceof Date) {
        if (isUTC) {
          date = new Date(data.getUTCFullYear(), data.getUTCMonth(),
            data.getUTCDate(), data.getUTCHours(),
            data.getUTCMinutes(), data.getUTCSeconds());
        } else {
          date = new Date(data.getFullYear(), data.getMonth(), data.getDate(), data.getHours(),
            data.getMinutes(), data.getSeconds());
        }
      } else {
        date = new Date(data.date.year, data.date.month - 1, data.date.day, data.time.hour,
          data.time.minute, data.time.second);
      }
      date.setTime(date.getTime() + offset);
      return date;
    },
    getOffset(timeZoneOffset) {
      let offset = 0;
      if (timeZoneOffset) {
        const hrsAndMin = timeZoneOffset.split(':');
        const hrs = +hrsAndMin[0];
        const mins = +hrsAndMin[1] ? +hrsAndMin[1] : 0;
        offset = (hrs * 60 * 60 * 1000) + (mins * 60 * 1000);
      }
      return offset;
    },
    formatDate(dateObj, showSeconds) {
      if (!dateObj) {
        return '';
      }
      const dateFormat = this.getCurrentDateFormat();
      const dateStr = this.convertToFormat(dateObj, dateFormat.dateFormat);
      const timeStr = this.converTimeToFormat(dateObj, showSeconds, dateFormat.is12HourFormat);
      return `${dateStr} ${timeStr}`;
    },
    converTimeToFormat(dateObj, showSeconds, is12HourFormat) {
      let hours = dateObj.getHours();
      let timePeriod = '';
      // For some countries we have to show in 12 hours format.
      if (is12HourFormat) {
        hours = hours > 12 ? hours - 12 : hours;
        timePeriod = dateObj.getHours() >= 12 && dateObj.getHours() !== 24 ? ' PM' : ' AM';
      }
      let timeStr = `${this.makeTwoDigits(hours)}:${
        this.makeTwoDigits(dateObj.getMinutes())}${timePeriod}`;
      if (showSeconds) {
        timeStr += `:${this.makeTwoDigits(dateObj.getSeconds())}`;
      }
      return timeStr;
    },
    makeTwoDigits(value) {
      if (value < 10) {
        return `0${value}`;
      }
      return value.toString();
    },
    getUTCDateWithOffset(timeZoneOffset) {
      const offset = this.getOffset(timeZoneOffset);
      const utcTimeStamp = this.getUTCDateObj();
      utcTimeStamp.setTime(utcTimeStamp.getTime() + offset);
      return utcTimeStamp;
    },
    getCurrentDateForLogsFileName() {
      let currentDate = new Date();
      return (
        `${String(this.makeTwoDigits(currentDate.getDate()))}${String(this.makeTwoDigits(currentDate.getMonth() + 1))}\
${String(currentDate.getFullYear())}-${String(this.makeTwoDigits(currentDate.getHours()))}${String(this.makeTwoDigits(currentDate.getMinutes()))}\
${String(this.makeTwoDigits(currentDate.getSeconds()))}`
      );
    },
    getUTCDateObj() {
      const now = new Date();
      const utcTimeStamp = new Date(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate(),
        now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds(), now.getUTCMilliseconds());
      return utcTimeStamp;
    },
    convertToFormat(dateObj, dateFormat) {
      const month = dateObj.getMonth() + 1;
      const date = dateObj.getDate();
      const year = dateObj.getFullYear();
      let dateString;
      switch (dateFormat) {
        case 'yyyy.m.d':
          dateString = `${year}.${month}.${date}`;
          break;
        case 'yyyy-m-d':
          dateString = `${year}-${month}-${date}`;
          break;
        case 'yyyy/m/d':
          dateString = `${year}/${month}/${date}`;
          break;
        case 'yyyy/mm/dd':
          dateString = `${year}/${this.makeTwoDigits(month)}/${this.makeTwoDigits(date)}`;
          break;
        case 'dd/mm/yyyy':
          dateString = `${this.makeTwoDigits(date)}/${this.makeTwoDigits(month)}/${year}`;
          break;
        case 'dd-mm-yyyy':
          dateString = `${this.makeTwoDigits(date)}-${this.makeTwoDigits(month)}-${year}`;
          break;
        case 'd-m-yyyy':
          dateString = `${date}-${month}-${year}`;
          break;
        case 'd/m/yyyy':
          dateString = `${date}/${month}/${year}`;
          break;
        case 'd/mm/yyyy':
          dateString = `${date}/${this.makeTwoDigits(month)}/${year}`;
          break;
        case 'dd.mm.yyyy':
          dateString = `${this.makeTwoDigits(date)}.${this.makeTwoDigits(month)}.${year}`;
          break;
        case 'm/d/yyyy':
          dateString = `${month}/${date}/${year}`;
          break;
        default:
          dateString = `${this.makeTwoDigits(date)}.${this.makeTwoDigits(month)}.${year}`;
      }
      return dateString;
    },
    getDateAndTimeAgoForNotifications(date, serverOffset) {
      // To specify date is in UTC time zone.
      // To render date and timeago based on the data we received as parameter.
      const dateTmp = this.getUTCSuffixDate(date);
      let dtObj = this.getDateObj(new Date(dateTmp), serverOffset, true);
      let dateStr = this.formatDate(dtObj, false);
      let timeAgoStr = $.timeago(dateTmp);
      // Array of date time in language format and timeago.
      return [dateStr, timeAgoStr];
    },
    getUTCSuffixDate(date) {
      // Returning date with UTC date suffix.
      return `${date}+00:00`;
    },
    getUTCTimeOnly() {
      // To get UTC date and time in current language format.
      const utcTimeStamp = this.getUTCDateObj();
      return this.formatTime(utcTimeStamp);
    },
    getCurrentTimeZoneTime(timeZoneOffset) {
      // To get current time based on current timezone offset in current date format.
      const offset = this.getOffset(timeZoneOffset);
      let utcTimeStamp = this.getUTCDateObj();
      utcTimeStamp.setTime(utcTimeStamp.getTime() + offset);
      return this.formatTime(utcTimeStamp);
    },
    formatTime(dateObj) {
      // To format date in 24 hr or 12 hr based on current language.
      let dateTimeFormat;
      if (typeof this.getCurrentDateFormat() === 'undefined') {
        dateTimeFormat = DEFAULT_DATE_FORMAT;
      } else {
        dateTimeFormat = this.getCurrentDateFormat();
      }
      let timeStr = this.converTimeToFormat(dateObj, false, dateTimeFormat.is12HourFormat);
      return timeStr;
    },
    /**
     * Called to render time difference with suffix.
     * If timeDiff is less than 24 hours then it returns timeDiff with H suffixed to it.
     * If timeDiff is more than 24 hr then it renders the time difference in days and hours format.
     * Always displaying minutes with M as suffix fot uptime.
     * @param {*} timeDiff
     * @returns
     * Input 23 --> Output 23H 0M
     * Input 23.66 --> Output 23H 39M
     * Input 27 --> Output 1D 3H  0M
     * Input 49 --> Output 2D 1H 0M
     * Input 27.50 --> Output 1D 3H 30M
     */
    renderTimeDifference(timeDiff) {
      if (typeof timeDiff === 'undefined') {
        return DEFAULT_VALUE;
      }
      const tempDiff = Math.floor(timeDiff);
      const minutes = Math.floor((timeDiff - tempDiff) * 60);
      if (tempDiff < 24) {
        return `${tempDiff}H ${minutes}M`;
      }
      const days = Math.floor(tempDiff / 24);
      const hours = tempDiff - (24 * days);
      return `${days}D ${hours}H ${minutes}M`;
    }
  },
};
