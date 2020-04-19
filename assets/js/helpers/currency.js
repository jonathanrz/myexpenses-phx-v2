import numbro from "numbro";

function format(value) {
  return `$${numbro(value / 100).format({
    thousandSeparated: true,
    mantissa: 2
  })}`;
}

const Currency = { format };
export default Currency;
