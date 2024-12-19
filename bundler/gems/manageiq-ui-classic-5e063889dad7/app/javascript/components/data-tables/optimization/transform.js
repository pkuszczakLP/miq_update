import React from 'react';
import { refresh } from './refresh.js';

function click(url, e) {
  // clicking on Queue should not trigger row click, stopPropagation doesn't work
  if (e && e.target.classList.contains('button-queue')) {
    return;
  }

  window.DoNav(url);
}

function queue(url) {
  return () => {
    window.miqSparkleOn();
    http
      .post(url, {})
      .then((data) => {
        window.add_flash(data.flash, 'success');
        return refresh();
      })
      .catch(() => window.miqSparkleOff());
  };
}

function formatDate(date) {
  return date ? moment(date).tz(ManageIQ.timezone || 'UTC').format('MM/DD/YYYY HH:mm:ss z') : null;
}

function transformSaved({
  id, report_id, name, last_run_on, userid, url,
}) {
  return {
    id,
    name,
    last_run_on: formatDate(last_run_on),
    userid,
    $onClick: () => click(url),
  };
}

function transformReport({
  id, name, last_run_on, count, action, url, queue_url,
}) {
  return {
    id,
    name,
    last_run_on: formatDate(last_run_on),
    count,
    action: (
      <div className="table-view-pf-btn">
        <button type="button" onClick={queue(queue_url)} className="btn btn-default button-queue">
          {__('Queue Report')}
        </button>
      </div>
    ),
    $onClick: (e) => click(url, e),
  };
}

export function miqOptimizationTransform(row) {
  switch (row.klass) {
    case 'MiqReportResult':
      return transformSaved(row);
    case 'MiqReport':
      return transformReport(row);
  }
}
