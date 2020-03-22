import React from "react";
import TableCell from "@material-ui/core/TableCell";
import Link from "@material-ui/core/Link";

import ModelTable from "../../shared/ModelTable";

const PATH = "categories";

function CategoriesTable({ data }) {
  return (
    <ModelTable
      data={data}
      path={PATH}
      label="Place"
      renderHeaders={() => (
        <React.Fragment>
          <TableCell>Name</TableCell>
        </React.Fragment>
      )}
      renderRowData={d => (
        <React.Fragment>
          <TableCell component="th" scope="row">
            <Link href={`${PATH}/${d.id}`}>{d.name}</Link>
          </TableCell>
        </React.Fragment>
      )}
    />
  );
}

export default CategoriesTable;
