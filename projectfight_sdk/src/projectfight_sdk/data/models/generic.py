from typing import Literal

type Vector3 = tuple[float, float, float]
type DecomposedVector3 = dict[Literal["x", "y", "z"], float]
type CoordinateMode = Literal["relative", "local"]

type InlineOrReference[T] = str | T
type MultipleInlineOrReference[T] = list[InlineOrReference[T]]
type OneOrMultipleInlineOrReference[T] = InlineOrReference[T] | list[InlineOrReference[T]]