import React from "react";
import TableCell from "@material-ui/core/TableCell";
import Link from "@material-ui/core/Link";
import moment from "moment";
import Currency from "../../../helpers/currency";

import ModelTable from "../../shared/ModelTable";

const PATH = "bills";

function BillsTable({ data }) {
  return (
    <ModelTable
      data={data}
      path={PATH}
      label="Bills"
      renderHeaders={() => (
        <React.Fragment>
          <TableCell>Name</TableCell>
          <TableCell>Init Date</TableCell>
          <TableCell>End Date</TableCell>
          <TableCell>Value</TableCell>
          <TableCell>Due Day</TableCell>
        </React.Fragment>
      )}
      renderRowData={(d) => (
        <React.Fragment>
          <TableCell component="th" scope="row">
            <Link href={`${PATH}/${d.id}`}>{d.name}</Link>
          </TableCell>
          <TableCell>{moment(d.init_date).format("DD/MM/YYYY")}</TableCell>
          <TableCell>{moment(d.end_date).format("DD/MM/YYYY")}</TableCell>
          <TableCell>{Currency.format(d.value)}</TableCell>
          <TableCell>{d.due_day}</TableCell>
        </React.Fragment>
      )}
    />
  );
}

export default BillsTable;
