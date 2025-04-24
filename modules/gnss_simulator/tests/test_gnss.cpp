#include <gtest/gtest.h>
#include "gnss.h"

TEST(GNSSDummyTest, ReturnsZero)
{
    EXPECT_EQ(gnss(), 0);
}
