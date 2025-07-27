# One Line Shimmer

A simple and customizable one-line shimmer effect widget for Flutter apps.

![shimmer](https://github.com/user-attachments/assets/2ba0169a-8ca6-4377-9c3f-916f7bb52141)


## Features

✅ Lightweight  
✅ One-line usage  
✅ Custom duration and colors  
✅ Fully responsive

## Getting Started

Add dependency in `pubspec.yaml`:

```yaml
dependencies:
  one_line_shimmer: ^1.0.0
```

## Usage
```
OneLineShimmer(
  width: 200,
  height: 20,
  borderRadius: BorderRadius.circular(16), //optional
  milliseconds: 1000, //optional
  baseColor: Colors.grey.shade100, //optional
  shimmerColors: [
    Colors.grey.shade300,
    Colors.grey.shade200,
    Colors.grey.shade100,
  ], //optional
);
```

## Parameters
| Parameter       | Description                                    |
| --------------- | ---------------------------------------------- |
| `width`         | Width of shimmer box                           |
| `height`        | Height of shimmer box                          |
| `borderRadius`  | Optional border radius                         |
| `milliseconds`  | Animation speed in milliseconds (default: 750) |
| `baseColor`     | Background color of box                        |
| `shimmerColors` | Exactly 3 shimmer gradient colors              |

