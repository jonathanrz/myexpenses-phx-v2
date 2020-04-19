import React from "react";
import TableCell from "@material-ui/core/TableCell";
import Link from "@material-ui/core/Link";

import ModelTable from "../../shared/ModelTable";

const PATH = "credit_cards";

function CreditCardsTable({ data }) {
  return (
    <ModelTable
      data={data}
      path={PATH}
      label="Credit Card"
      renderHeaders={() => (
        <React.Fragment>
          <TableCell>Name</TableCell>
          <TableCell>Account</TableCell>
        </React.Fragment>
      )}
      renderRowData={d => (
        <React.Fragment>
          <TableCell component="th" scope="row">
            <Link href={`${PATH}/${d.id}`}>{d.name}</Link>
          </TableCell>
          <TableCell component="th" scope="row">
            <Link href={`accounts/${d.account.id}`}>{d.account.name}</Link>
          </TableCell>
        </React.Fragment>
      )}
    />
  );
}

export default CreditCardsTable;
